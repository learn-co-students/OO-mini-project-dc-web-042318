class RecipeIngredient
  attr_reader :recipe, :ingredient

  @@recipeingredients = []

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@recipeingredients << self
  end

  def self.all
    @@recipeingredients
  end

end
