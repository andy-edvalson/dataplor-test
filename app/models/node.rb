class Node < ApplicationRecord

  # Self referential keying on parent_node
  has_many :child_nodes, class_name: 'Node', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_node, class_name: 'Node', optional: true, foreign_key: 'parent_id'
  has_many :birds
  
  # Crawl up the "family tree", building a list of nodes
  # into a list, starting from the bottom up
  def ancestors
    node = self
    ancestors = []
    while node.parent_node.present?
      ancestors << node.parent_node
      node = node.parent_node
    end
    ancestors
  end

  # Build a list of child nodes from the top down
  # Same as ancestors, but going the opposite direction
  def descendants
    descendants = []
    self.child_nodes.each do |child|
      descendants << child
      descendants.concat(child.descendants)
    end
    descendants
  end
end
