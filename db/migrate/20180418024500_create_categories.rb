class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :name
      t.timestamps
    end
    add_column  :products, :category_id, :integer
  end
end
