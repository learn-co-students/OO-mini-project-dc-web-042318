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

  def declare_allergen(ingredient)
    Allergen.new(self.id, ingredient.id)
  end

  def allergens
    allergies = Allergen.all.map do |allergy|
      if allergy.user_id == self.id
        Ingredient.find_by_id(allergy.ingredient_id)
      end
    end.compact
    allergies == [] ? "No allergies!" : allergies
  end

  def add_recipe_card(recipe, rating, date=Time.now)
    @recipes << recipe
    new_card = RecipeCard.new(recipe.id, self.id, date, rating)
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
    top_cards = return_all_cards.sort_by! {|card| card.rating}.last(3)
    top_cards.map {|card| Recipe.find_by_id(card.recipe_id)}
  end

  def most_recent_recipe
    return_all_cards.sort_by! {|card| card.date}.last
  end

  def unsafe_recipes
    unsafe = []
    allergens.each do |allergy|
      Recipe.all.each do |recipe|
        if recipe.ingredients.include?(allergy)
          unsafe.push(recipe)
        end
      end
    end
    unsafe
  end

end
