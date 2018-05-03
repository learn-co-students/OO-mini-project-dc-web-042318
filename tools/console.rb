require_relative '../config/environment.rb'



adam = User.new('Adam')
richard = User.new('Richard')
amy = User.new('Amy')
lucas = User.new('Lucas')
josh = User.new('Josh')

pizza = Recipe.new('Pizza')
pie = Recipe.new('Pie')
burrito = Recipe.new('Burrito')
hamburger = Recipe.new('Hamburger')
pasta = Recipe.new('Pasta')

kiwi = Ingredient.new('Kiwi')
avocado = Ingredient.new('Avocado')
apple = Ingredient.new('Apple')
cheese = Ingredient.new('Cheese')
tomato = Ingredient.new('Tomato')
beef = Ingredient.new('Beef')
lettuce = Ingredient.new('Lettuce')
bun = Ingredient.new('Bun')
noodle = Ingredient.new('Noodle')

adam.add_recipe_card(pizza, 10)

adam.add_recipe_card(pie, 10)

richard.add_recipe_card(pizza, 10)

richard.add_recipe_card(burrito, 10)

richard.add_recipe_card(hamburger, 8)

richard.add_recipe_card(pasta, 10)

richard.add_recipe_card(pie, 10)

lucas.add_recipe_card(pie, 10)

amy.add_recipe_card(pie, 10)

josh.add_recipe_card(pie, 10)


pizza.add_ingredients([tomato, cheese])
burrito.add_ingredients([avocado, cheese, tomato])
pie.add_ingredients([apple, kiwi])
hamburger.add_ingredients([lettuce, beef, bun])
pasta.add_ingredients([noodle, tomato, cheese])

richard.declare_allergen(kiwi)
richard.declare_allergen(apple)
adam.declare_allergen(avocado)


binding.pry
