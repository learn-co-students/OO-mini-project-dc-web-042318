class Recipe
  attr_accessor :ingredients
  attr_reader :name

  @@recipes = []
  

  def initialize(name)
    @name = name
    @@recipes << self
    @ingredients = []
  end

  def self.all
    @@recipes
  end

  def users
    cards = RecipeCard.all.map {|obj| obj if obj.recipe == self}.compact
    cards.map {|card| card.user}.uniq
  end

  def self.most_popular
    recipe_hash = RecipeCard.all.each_with_object(Hash.new(0)) do |obj, hash|
      hash[obj.recipe] += 1
    end
    recipe_hash.max_by { |rec, c| c }
    binding.pry
  end

  def add_ingredients(ingredients)
    ingredients.each {|i| RecipeIngredient.new(self, i)}
    self.ingredients = ingredients
  end

end
