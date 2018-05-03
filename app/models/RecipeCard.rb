class RecipeCard

  attr_accessor :recipe_id, :user_id, :date, :rating, :test

  @@all = []

  def initialize(recipe_id, user_id, date, rating)
    @recipe_id = recipe_id
    @user_id = user_id
    @@all << self
    @date = date
    @rating = rating
  end

  def self.all
    @@all
  end

  def user
    User.find_by_id(user_id)
  end

  def recipe
    Recipe.find_by_id(recipe_id)
  end

end
