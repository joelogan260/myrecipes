require 'test_helper'

class ChefsIndexTest < ActionDispatch::IntegrationTest

	def setup
  	@chef = Chef.create!(chefname: "mashrur", email: "mashrur1@example.com",
										password: "password", password_confirmation: "password")
  	@recipe = Recipe.create(name: "vegetables saute2", description:"great vegetables saute, add vegetabes and oil", chef: @chef)
		@recipe2 = @chef.recipes.build(name: "chicken saute", description:"great chicken dish")
		@recipe2.save
		@chef2 = Chef.create!(chefname: "john", email: "john@example.com",
                    password: "password", password_confirmation: "password")
  end
  
  test "shoul get chefs index" do
  	get chefs_path
  	assert_response :success
  end

  test "should get chefs listing" do
  	get chefs_path
  	assert_template 'chefs/index'
  	assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname.capitalize
  	assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chefname.capitalize
  	#assert_match @chef.recipes.count, response.body 
  end 

  test "should get chefs show" do

  end
end
