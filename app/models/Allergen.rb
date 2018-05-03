class Allergan
  attr_accessor :ingredient, :user

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.most_common_allergan
    counter = Hash.new(0)
    Allergan.all.each { |c| counter[c.ingredient] += 1 }
    counter.key(counter.values.max)
  end

  def self.all
    @@all
  end
end
