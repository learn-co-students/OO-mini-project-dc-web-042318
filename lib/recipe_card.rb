class RecipeCard
 attr_reader :user, :recipe, :rating, :date

  @@recipecards =  []

 def initialize(user, recipe, rating, date)
   @user = user
   @recipe = recipe
   @rating = rating
   @date = date
   @@recipecards << self
 end

 def self.all
   @@recipecards
 end

end
