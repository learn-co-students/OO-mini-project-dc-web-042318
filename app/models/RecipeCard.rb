class RecipeCard

  attr_accessor :recipe_id, :user_id, :date, :rating

  @@all = []

  def initialize(recipe_id, user_id)
    @recipe_id = recipe_id
    @user_id = user_id
    @@all << self
  end

  def self.all
    @@all
  end

end
