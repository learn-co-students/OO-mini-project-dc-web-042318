require_relative '../config/environment.rb'

#RECIPES
potroast = Recipe.new("potroast")
burger = Recipe.new("burger")
fries = Recipe.new("burger")
salad = Recipe.new("fries")
sushi = Recipe.new("sushi")

#INGREDIENTS
salt = Ingredient.new("salt")
pepper = Ingredient.new("pepper")
beef = Ingredient.new("beef")
onion = Ingredient.new("onion")
bayleaf = Ingredient.new("bayleaf")
potatoes = Ingredient.new("potatoes")
lettuce = Ingredient.new("lettuce")
tomatoes = Ingredient.new("tomatoes")
oliveoil = Ingredient.new("oliveoil")
vinegar = Ingredient.new("vinegar")
cheese = Ingredient.new("cheese")
carrots = Ingredient.new("carrots")
bacon = Ingredient.new("bacon")
tuna = Ingredient.new("tuna")
rice = Ingredient.new("rice")

#INGREDIENT LISTS
potroast_list = [salt, pepper, beef, onion, bayleaf, potatoes, carrots]
burger_list = [salt, pepper, beef, onion, lettuce, tomatoes, cheese]
fries_list = [salt, pepper, potatoes, oliveoil]
salad_list = [pepper, onion, lettuce, tomatoes, oliveoil, vinegar, carrots]
sushi_list = [tuna, rice]

#ADD INGREDIENTS
potroast.add_ingredients(potroast_list)
burger.add_ingredients(burger_list)
fries.add_ingredients(fries_list)
salad.add_ingredients(salad_list)
sushi.add_ingredients(sushi_list)

#USERS
jake = User.new("jake")
bob = User.new("bob")
sarah = User.new("sarah")
jess = User.new("jess")

#DECLARE ALLERGENS
sarah.declare_allergen(bayleaf)
jess.declare_allergen(tuna)
jess.declare_allergen(rice)
jess.declare_allergen(bayleaf)
jake.declare_allergen(cheese)

#RECIPE CARDS
jake.add_recipe_card(potroast, 5, Time.new(2010))
jake.add_recipe_card(burger, 3, Time.new(2011))
jake.add_recipe_card(fries, 1, Time.new(2018))
jake.add_recipe_card(salad,  3)
jake.add_recipe_card(sushi, 3)
bob.add_recipe_card(potroast, 4, Time.new(2003))
bob.add_recipe_card(burger, 2, Time.new(2014))
sarah.add_recipe_card(fries, 5)
sarah.add_recipe_card(salad, 1, Time.new(2015))
jess.add_recipe_card(burger, 5)
jess.add_recipe_card(fries, 1, Time.new(2012))

binding.pry
