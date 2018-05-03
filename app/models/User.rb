class User

  attr_accessor :name
  attr_reader :recipes, :id

  @@all = []
  @@id_count = 0

  def initialize(name)
    @name = name
    @recipes = []
    @@id_count += 1
    @id = @@id_count
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe_card(recipe, rating, date  = Time.now)
    @recipes << recipe
    new_card = RecipeCard.new(recipe.id, self.id, date)
    new_card.rating = rating
  end

  def return_all_cards
    RecipeCard.all.select do |card|
      card.user_id = self.id
    end
  end

  def self.find_by_id(user_id)
    @@all.find {|user| user.id == user_id }
  end

  def top_three_recipes
    return_all_cards.sort_by! {|card| card.rating}.last(3)
  end

  def most_recent_recipe

  end

end
