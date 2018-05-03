class RecipieCard

  attr_accessor :recipie_id, :user_id, :date, :rating

  @@all = []

  def initialize(recipie_id, user_id)
    @recipie_id = recipie_id
    @user_id = user_id
    @@all << self
  end

  def self.all
    @@all
  end

end
