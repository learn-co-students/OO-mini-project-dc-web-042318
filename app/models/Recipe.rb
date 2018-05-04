class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    RecipeCard.all.select { |r| r.user if r.recipe == self }
  end

  def add_ingredients(ingredients)
    ingredients.each { |i| RecipeIngredient.new(self, i) }
  end

  def ingredients
    RecipeIngredient.all.select { |r| r.ingredient if r.recipe == self }
  end

  def allergens
    self.ingredients.each do |ingredient|
      Allergen.all.select { |a| a.ingredient if ingredient.ingredient == a.ingredient }
    end
  end

  def self.most_popular
    counter = RecipeCard.all.each_with_object(Hash.new(0)) { |k, h| h[k.recipe] += 1 }
    counter.key(counter.values.max)
  end

  def self.all
    @@all
  end
end
