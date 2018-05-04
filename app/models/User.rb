class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, rating)
    RecipeCard.new(self, recipe, rating)
  end

  def recipes
    RecipeCard.all.select { |r| r.recipe if r.user == self }
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select { |a| a.ingredient if a.user == self }
  end

  def most_recent_recipe
    sorted_dates = RecipeCard.all.sort_by { |c| c.date }
    sorted_dates.select { |sc| sc.recipe if sc.user == self }.last
  end

  def top_three_recipes
    sorted_recipes = RecipeCard.all.sort_by { |c| c.rating }
    sorted_recipes.select { |sc| sc.recipe if sc.user == self }.last(3)
  end

  def safe_recipes
    self.allergens.each do |allergen|
      return Recipe.all.select { |r| r unless r.ingredients.include?(allergen.ingredient) }
    end
  end

  def self.all
    @@all
  end
end
