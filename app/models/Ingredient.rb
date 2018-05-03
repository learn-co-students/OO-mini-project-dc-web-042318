class Ingredient

  attr_accessor :ingredient_name, :id

  @@all = []
  @@id_count = 0

  def initialize(ingredient_name)
    @ingredient_name = ingredient_name
    @@all << self
    @@id_count += 1
    @id = @@id_count
  end

  def self.all
    @@all
  end

end
