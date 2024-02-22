# app/controllers/birds_controller.rb
class BirdsController < ApplicationController
  def index
    # Split up node_ids param to array of int
    node_ids = params[:node_ids].to_s.split(',').map(&:to_i)

    # Get all starting nodes from DB
    nodes = Node.includes(:birds).where(id: node_ids)

    bird_ids = nodes.each_with_object([]) do |node, ids|
      ids.concat(node.birds.pluck(:id))
      # Use descendants method from model to map out 
      # child nodes with all their birds
      ids.concat(node.descendants.flat_map { |descendant| descendant.birds.pluck(:id) })
    end.uniq

    render json: { bird_ids: bird_ids }
  end
end