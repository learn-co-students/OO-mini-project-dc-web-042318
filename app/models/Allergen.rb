class Allergen
  attr_accessor :ingredient, :user

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.most_common_allergen
    counter = Allergen.all.each_with_object(Hash.new(0)) { |k, h| h[k.ingredient] += 1 }
    counter.key(counter.values.max)
  end

  def self.all
    @@all
  end
end
