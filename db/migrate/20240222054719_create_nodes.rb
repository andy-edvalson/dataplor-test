class CreateNodes < ActiveRecord::Migration[7.1]
  def change
    create_table :nodes, id: false do |t|
      t.primary_key :id, :integer
      t.integer :parent_id
      t.index :parent_id
    end
  end
end
