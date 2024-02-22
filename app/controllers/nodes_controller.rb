class NodesController < ApplicationController
  
  # Find the nearest common parent for nodes a and b.
  # Use array of ancestors provided by model to traverse. 
  def common_ancestor
    left_node = Node.find_by(id: params[:a])
    right_node = Node.find_by(id: params[:b])

    if left_node.nil? || right_node.nil?
      # Invalid / nil params. Return null for all fields as per specs
      render json: { root_id: nil, lowest_common_ancestor: nil, depth: nil }
    elsif params[:a] == params[:b]
      # If params match, then the node itself is the common ancestor
      depth = left_node.ancestors.size + 1
      render json: { root_id: left_node.id, lowest_common_ancestor: left_node.id, depth: depth }
    else
      # Get intersection of ancestors. The first element is the lowest common.
      common_ancestors = left_node.ancestors & right_node.ancestors
      lowest_common_ancestor = common_ancestors.first

      if lowest_common_ancestor
        # If we have a common ancestor, calculate the depth 
        depth = lowest_common_ancestor.ancestors.length + 1 
        render json: { root_id: common_ancestors.last.id, lowest_common_ancestor: lowest_common_ancestor.id, depth: depth }
      else
        # If there is no common ancestor found, return nil
        render json: { root_id: nil, lowest_common_ancestor: nil, depth: nil }
      end
    end
  end
end