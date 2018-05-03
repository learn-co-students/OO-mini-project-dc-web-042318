require_relative '../config/environment.rb'

jake = User.new("jake")
bob = User.new("bob")

potroast = Recipe.new("potroast")
chicken = Recipe.new("chicken")
burger = Recipe.new("burger")
fries = Recipe.new("fries")


jake.add_recipe_card(potroast, 5, Time.new(2010))
jake.add_recipe_card(chicken, 3, Time.new(2011))
bob.add_recipe_card(burger, 4, Time.new(2000))
bob.add_recipe_card(fries, 2, Time.new(2014))
jake.add_recipe_card(fries, 1, Time.new(2018))
jake.add_recipe_card(fries,  3)
jake.add_recipe_card(fries, 3)


onion = Ingredient.new("onion")
basil = Ingredient.new("basil")
produce = [onion, basil]

potroast.add_ingredients(produce)

binding.pry
