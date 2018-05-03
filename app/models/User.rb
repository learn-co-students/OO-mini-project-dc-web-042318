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
    RecipeCard.all.map { |r| r.recipe if r.user == self }.compact
  end

  def declare_allergan(ingredient)
    Allergan.new(self, ingredient)
  end

  def allergans
    Allergan.all.map { |a| a.ingredient if a.user == self }.compact
  end

  def most_recent_recipe
    sorted_dates = RecipeCard.all.sort_by { |c| c.date }
    sorted_dates.map { |sc| sc.recipe if sc.user == self }.compact.last
  end

  def top_three_recipes
    sorted_recipes = RecipeCard.all.sort_by { |c| c.rating }.reverse
    sorted_recipes.map { |sc| sc.recipe if sc.user == self }.compact.take(3)
  end

  def safe_recipes
    self.allergans.each do |allergen|
      return Recipe.all.map { |r| r unless r.ingredients.include?(allergen) }.compact
    end
  end

  def self.all
    @@all
  end
end
