require_relative '../config/environment.rb'

jake = User.new("jake")
potroast = Recipie.new("potroast")
chicken = Recipie.new("chicken")
jake.add_recipie_card(potroast, "today", 5)
jake.add_recipie_card(chicken, "yesterday", 3)

binding.pry
