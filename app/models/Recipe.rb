class Recipie

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

  def add_ingredient(ingredient)
    @ingredients << ingredient
  end

  def self.all
    @all
  end


end
