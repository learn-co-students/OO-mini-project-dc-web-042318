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

  def allergans
    Allergan.all.map do |allergan|
      self.ingredients.select { |i| allergan.ingredient == i}
    end.flatten
  end

  def self.most_popular
    counter = Hash.new(0)
    RecipeCard.all.each { |c| counter[c.recipe] += 1 }
    counter.key(counter.values.max)
  end

  def self.all
    @@all
  end
end
