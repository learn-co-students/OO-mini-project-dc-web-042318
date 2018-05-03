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
    RecipeCard.all.map do |recipecard|
      recipecard.recipe if recipecard.user == self
    end.compact
  end

  def most_recent_recipe
    sorted_dates = RecipeCard.all.sort_by do |instance|
      instance.date
    end
    sorted_dates.map do |sortedcards|
      sortedcards.recipe if sortedcards.user == self
    end.compact.last
  end

  def top_three_recipes
    sorted_ratings = RecipeCard.all.sort_by do |instance|
      instance.rating
    end.reverse
    sorted_ratings.map do |sortedcards|
      sortedcards.recipe if sortedcards.user == self
    end.compact.take(3)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.map do |allergen_type|
      allergen_type.ingredient if allergen_type.user == self
    end.compact
  end

  def self.all
    @@all
  end

  def safe_recipes
    self.allergens.each do |allergen|
      return Recipe.all.map do |instance|
        instance if !instance.ingredients.include?(allergen)
      end.compact
    end
  end

end
