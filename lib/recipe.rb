class Recipe
 attr_accessor :name

 @@recipes = []

 def initialize(name)
   @name = name
   @@recipes << self
 end

 def self.all
   @@recipes
 end

 







end
