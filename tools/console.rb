require_relative '../config/environment.rb'

adam = User.new('Adam')
richard = User.new('Richard')

pizza = Recipe.new('pizza')
pie = Recipe.new('pie')
burrito = Recipe.new('burrito')
pasta = Recipe.new('pasta')
sushi = Recipe.new('sushi')
soda = Recipe.new('soda')

tomato_sauce = Ingredient.new('tomato_sauce')
flour = Ingredient.new('flour')
cheese = Ingredient.new('cheese')
kiwi = Ingredient.new('kiwi')
avocado = Ingredient.new('avocado')
chicken = Ingredient.new('chicken')
apple = Ingredient.new('apple')

adam.declare_allergen(cheese)
richard.declare_allergen(kiwi)
adam.declare_allergen(kiwi)
richard.declare_allergen(apple)
adam.declare_allergen(apple)

adam.add_recipe_card(pizza, 10)
richard.add_recipe_card(pasta, 100)
richard.add_recipe_card(pasta, 8)
adam.add_recipe_card(pie, 5)
richard.add_recipe_card(pizza, 3)
richard.add_recipe_card(burrito, 9)
richard.add_recipe_card(pie, 3)
richard.add_recipe_card(sushi, 4)
richard.add_recipe_card(soda, 3)


pizza.add_ingredients([tomato_sauce, flour, cheese])
pie.add_ingredients([kiwi, apple])


binding.pry
