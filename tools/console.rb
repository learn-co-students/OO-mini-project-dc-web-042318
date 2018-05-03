require_relative '../config/environment.rb'

jake = User.new("jake")
bob = User.new("bob")

potroast = Recipe.new("potroast")
chicken = Recipe.new("chicken")
burger = Recipe.new("burger")
fries = Recipe.new("fries")


jake.add_recipe_card(potroast, "today", 5)
jake.add_recipe_card(chicken, "yesterday", 3)
bob.add_recipe_card(burger, "today", 4)
bob.add_recipe_card(fries, "Friday", 2)
jake.add_recipe_card(fries, "today", 1)
jake.add_recipe_card(fries, "Friday", 3)
jake.add_recipe_card(fries, "Friday", 3)


onion = Ingredient.new("onion")
basil = Ingredient.new("basil")
produce = [onion, basil]

potroast.add_ingredients(produce)

binding.pry
