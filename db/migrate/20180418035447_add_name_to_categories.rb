class AddNameToCategories < ActiveRecord::Migration[5.1]
  def change

    remove_column :categories, :name, :integer
    add_column :categories, :name, :string
  end
end
