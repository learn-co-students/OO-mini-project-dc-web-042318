class User
 attr_accessor :name

@@users = []

 def initialize(name)
   @name = name
   @@users << self
 end

 def declare_allergen(ingredient)
   Allergen.new(self, ingredient)
 end

 def self.all
   @@users
 end

 def add_recipe_card(user, recipe, rating, date)
    RecipeCard.new(user, recipe, rating, date)
 end


end
