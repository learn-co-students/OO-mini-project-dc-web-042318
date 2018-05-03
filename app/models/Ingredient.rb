class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    counter = Hash.new(0)
    Allergen.all.each do |instance|
      counter[instance.ingredient] += 1
    end
    return counter.key(counter.values.max)
  end

end
