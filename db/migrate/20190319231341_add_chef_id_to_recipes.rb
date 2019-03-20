class AddChefIdToRecipes < ActiveRecord::Migration[5.2]
  def change
  	#add_column :recipes, :chef_id, :integer
  	add_reference :recipes, :chef, foreign_key: true
  end
end
