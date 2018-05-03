class Recipe 

  attr_accessor :dish_name, :id, :ingredients

  @@all = []
  @@id_count = 0

  def initialize(dish_name)
    @dish_name = dish_name
    @@all << self
    @@id_count += 1
    @id = @@id_count
    @ingredients = []
  end

  def add_ingredients(ingredients_list)
    ingredients_list.each {|ingredient| add_ingredient(ingredient)}

  end

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end

  def self.all
    @all
  end

  def users
    users = []
    RecipeCard.all.each do |card|
      #binding.pry
       if card.recipe_id == self.id
        
        users.push(User.find_by_id(card.user_id))
       end
    end
      users
  end

  def self.most_popular
    @@all.sort_by! do |recipe| 
      recipe.users.length
      #binding.pry
    end.last
  end


end
