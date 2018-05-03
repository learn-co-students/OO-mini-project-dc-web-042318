class User
  attr_accessor :name, :test_top_three

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

  def add_recipe_card(recipe, rating, date)
    RecipeCard.new(self, recipe, rating, date)
  end

  def user_recipes
    user_recipes = RecipeCard.all.map {|obj| obj if obj.user == self}.compact
  end

  def top_three_recipes
    user_recipes.sort_by {|obj| obj.rating}.reverse[0..2]
  end

  def most_recent_recipe
    user_recipes.sort_by {|obj| obj.date}.reverse[0]
  end

  def allergens
    user_allergens = Allergen.all.select{|allergen| allergen.user == self }
    user_allergens.map{|allergen| allergen.ingredient}
  end

end
