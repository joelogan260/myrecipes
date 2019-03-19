class ChangeColumnInRecipes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :recipes, :email, :description
  	change_column :recipes, :description, :text
  end
end
