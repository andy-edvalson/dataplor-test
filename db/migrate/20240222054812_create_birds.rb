class CreateBirds < ActiveRecord::Migration[7.1]
  def change
    create_table :birds do |t|
      t.integer :node_id
      t.timestamps
    end
    add_index :birds, :node_id
    add_foreign_key :birds, :nodes, column: :node_id
  end
end
