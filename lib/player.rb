#SPECIFICATIONS class Player

# ¿WHY?
#Cette classe implemente un joueur

#les caracteristiques d'un joueur sont :
# => son nom
# => son pion choisi
# => sa couleur
# => son nombre de victoires


class Player
	attr_accessor :name, :circle_or_cross, :score
	def initialize (name, circle_or_cross)
		@score = 0
		@name = name
		@circle_or_cross = circle_or_cross
	end
end