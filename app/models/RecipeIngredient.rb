class RecipeIngredient

  attr_accessor :recipe_id, :ingredient_id

  @@all = []

  def initialize(recipe_id, ingredient_id)
    @recipe_id = recipe_id
    @ingredient_id = ingredient_id
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredient
    Ingredient.find_by_id(self.ingredient_id)
  end

  def recipe
    Recipe.find_by_id(recipe_id)
  end

end
