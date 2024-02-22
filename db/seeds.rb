# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'csv'

# Import nodes.csv nodes
raw_csv_text = File.read(Rails.root.join('seeds', 'nodes.csv'))
csv = CSV.parse(raw_csv_text, :headers => true)
csv.each do |row|
  Node.create!(id: row['id'], parent_id: row['parent_id'])
end

puts "Imported #{Node.count} nodes"


# Add some Arbitrary Birds for testing
root_node = Node.find(1045177)
4.times do |i|
  Bird.create(node: root_node)
end

child_node = Node.find(4781951)
2.times do |i|
  Bird.create(node: child_node)
end