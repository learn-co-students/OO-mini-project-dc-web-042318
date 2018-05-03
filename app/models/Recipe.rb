require 'pry'
class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def users
    RecipeCard.all.map do |recipecard|
      recipecard.user if recipecard.recipe == self
    end.compact
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def ingredients
    RecipeIngredient.all.map do |recipeingredient|
      recipeingredient.ingredient if recipeingredient.recipe == self
    end.compact
  end

  def allergens
    Allergen.all.map do |instance|
      self.ingredients.select do |ingredient|
        instance.ingredient == ingredient
      end
    end.flatten
  end

  def self.most_popular
    counter = Hash.new(0)
    RecipeCard.all.each do |instance|
      counter[instance.recipe] += 1
    end
    return counter.key(counter.values.max)
  end

end
