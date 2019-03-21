require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
  	@chef = Chef.create!(chefname: "mashrur", email: "mashrur1@example.com")
  	#@recipe = @chef.recipes.build(name: "vegetables saute2", description:"great vegetables saute, add vegetabes and oil")
	@recipe = Recipe.create(name: "vegetables saute2", description:"great vegetables saute, add vegetabes and oil", chef: @chef)
	@recipe2 = @chef.recipes.build(name: "chicken saute", description:"great chicken dish")
	@recipe2.save
  end
 
 test "should get recipes index" do
 	get recipes_path
 	assert_response :success
 end

 test "should get recipes listing" do
 	get recipes_path
 	assert_template 'recipes/index'
 	assert_match @recipe.name, response.body 
 	assert_match @recipe2.name, response.body
 end
end
