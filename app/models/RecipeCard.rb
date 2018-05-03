class RecipieCard

  attr_accessor :recipie, :user_id, :date, :rating

  @@all = []

  def initialize(recipie, user_id)
    @recipie = recipie
    @user_id = user_id
    @@all << self
  end

  def self.all
    @@all
  end

end
