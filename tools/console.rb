require_relative '../config/environment.rb'
require 'pry'


munir = User.new("Munir")
deep = User.new("Deep")

pizza = Recipe.new("Pizza")
pasta = Recipe.new("Pasta")
macandcheese = Recipe.new("Mac and Cheese")

mozarella = Ingredient.new("mozarella")
pepperoni = Ingredient.new("pepperoni")
floor = Ingredient.new("floor")
sauce = Ingredient.new("sauce")
mushroom = Ingredient.new("mushroom")
maccaroni = Ingredient.new("maccaroni")
cheese = Ingredient.new("cheese")
nuts = Ingredient.new("nuts")

pizza_ingredients = [mozarella, pepperoni, floor, sauce]
pasta_ingredients = [mushroom, floor, sauce]
macandcheese_ingredients = [maccaroni, cheese]

pizza.add_ingredients(pizza_ingredients)
pasta.add_ingredients(pasta_ingredients)
macandcheese.add_ingredients(macandcheese_ingredients)


# munir.add_recipe_card(pizza, 8)
deep.add_recipe_card(pasta, 7)
sleep(1)
munir.add_recipe_card(pasta, 5)
sleep(1)
deep.add_recipe_card(pizza, 9)
sleep(1)
munir.add_recipe_card(macandcheese, 5)

munir.declare_allergen(sauce)
munir.declare_allergen(nuts)
# deep.declare_allergen("sauce")

binding.pry
puts 'asdf'