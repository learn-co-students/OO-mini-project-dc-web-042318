class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    RecipeCard.all.map { |r| r.user if r.recipe == self }.compact
  end

  def add_ingredients(ingredients)
    ingredients.each { |i| RecipeIngredient.new(self, i) }
  end

  def ingredients
    RecipeIngredient.all.map { |r| r.ingredient if r.recipe == self }.compact
  end

  def allergens
    Allergen.all.map do |allergen|
      self.ingredients.select { |i| allergen.ingredient == i }
    end.flatten
  end

  def self.most_popular
    counter = RecipeCard.all.each_with_object(Hash.new(0)) { |k, h| h[k.recipe] += 1 }
    counter.key(counter.values.max)
  end

  def self.all
    @@all
  end
end
