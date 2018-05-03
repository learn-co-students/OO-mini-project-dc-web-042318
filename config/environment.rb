require 'pry'
require 'bundler/setup'
Bundler.require
require_all 'app'


require_relative '../lib/ingredient.rb'
require_relative '../lib/recipe_card.rb'
require_relative '../lib/allergen.rb'
require_relative '../lib/recipe.rb'
require_relative '../lib/user.rb'
require_relative '../lib/recipe_ingredient'

# Create Users
lucas = User.new("Lucas")
britt = User.new("Britt")
anna = User.new("Anna")

# Create Recipes
chicken_salad = Recipe.new("Chicken Salad")
tacos = Recipe.new("Tacos")
bacon_and_eggs = Recipe.new("Bacon & Eggs")
salad = Recipe.new("Salad")
ice_cream = Recipe.new("Ice Cream")

# Create Recipe Cards
lucas.add_recipe_card(tacos, "5", "05-0501")
britt.add_recipe_card(chicken_salad, "1", "10-0830")
lucas.add_recipe_card(bacon_and_eggs, "5", "18-0502")
anna.add_recipe_card(chicken_salad, "4", "12-0114")
lucas.add_recipe_card(chicken_salad, "3", "18-0402")
lucas.add_recipe_card(bacon_and_eggs, "1", "15-0501")
lucas.add_recipe_card(ice_cream, "4", "18-0502")

# Create Ingredients
eggs = Ingredient.new("Eggs")
bacon = Ingredient.new("Bacon")
onions = Ingredient.new("Onions")
chicken = Ingredient.new("Chicken")
ground_beef = Ingredient.new("Ground Beef")
dairy = Ingredient.new("Dairy")
lettuce = Ingredient.new("Lettuce")
tomatoes = Ingredient.new("Tomatoes")

# Declare Allergens
lucas.declare_allergen(tomatoes)
britt.declare_allergen(onions)
anna.declare_allergen(dairy)
lucas.declare_allergen(chicken)
britt.declare_allergen(tomatoes)


chk_sal_ings = [onions, chicken, lettuce, eggs, tomatoes]
chicken_salad.add_ingredients(chk_sal_ings)

binding.pry

puts "done"
