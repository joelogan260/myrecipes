require 'test_helper'

class RecipesDeleteTest < ActionDispatch::IntegrationTest
  def setup
  	@chef = Chef.create!(chefname: "mashrur", email: "mashrur1@example.com",
										password: "password", password_confirmation: "password")
		@recipe = Recipe.create(name: "vegetables saute2", description:"great vegetables saute, add vegetabes and oil", chef: @chef)
	end

	test "succesfully delete a recipe" do
		get recipe_path(@recipe)
		assert_template 'recipes/show'
		assert_select 'a[href=?]', recipe_path(@recipe), text: "Delete this recipe"
		assert_difference 'Recipe.count', -1 do
			delete recipe_path(@recipe)
		end
		assert_redirected_to recipes_path
		assert_not flash.empty?
	end
end
