#SPECIFICATIONS class BoardCase

# ¿WHY?
#Cette classe implémente une case de jeu, elle en gere les différents etats

#etats :
# => VIDE
# => selectionnée par un joueur
# => CIRCLE is TRUE
# => CROSS is FALSE
#fonctions :
# => printcase
# => is free
# => 

class BoardCase
	attr_accessor :circle_or_cross, :selected, :case_checked
	def initialize
		@selected = false
		@case_checked = false
		@circle_or_cross = false
	end
	def get_sign
		return circle_or_cross if case_checked
		puts "There must be an error, you try to access an unchecked case"
	end
	def check_case (player)
		@case_checked = true
		@circle_or_cross = player.circle_or_cross
	end
	def print_case(line)
		if !selected then
			if !@case_checked then #the case isnt checked
				print "╔═════════╗" if line == 0
				print "║         ║" if line == 1
				print "║         ║" if line == 2
				print "║         ║" if line == 3
				print "╚═════════╝" if line == 4
			elsif circle_or_cross then #the case is checked and the symbol is a circle
				print "╔═════════╗" 							if line == 0
				print "║    "+"■".red+"    ║" 					if line == 1
				print "║  "+"■".red+"   "+"■".red+"  ║"     	if line == 2
				print "║    "+"■".red+"    ║" 					if line == 3
				print "╚═════════╝" 							if line == 4
			else #the case is checked and the symbol is a cross
				print "╔═════════╗" 									if line == 0
				print "║  "+"■".light_blue+"   "+"■".light_blue+"  ║" 	if line == 1
				print "║    "+"■".light_blue+"    ║" 					if line == 2
				print "║  "+"■".light_blue+"   "+"■".light_blue+"  ║" if line == 3
				print "╚═════════╝" 																	if line == 4
			end
		else   # the user is currently selecting this case
			if !@case_checked then #the case isnt checked
				print "╔═════════╗".green if line == 0
				print "║         ║".green if line == 1
				print "║         ║".green if line == 2
				print "║         ║".green if line == 3
				print "╚═════════╝".green if line == 4
			elsif circle_or_cross then #the case is checked and the symbol is a circle
				print "╔═════════╗".green														if line == 0
				print "║    ".green+"■".red+"    ║".green 					if line == 1
				print "║  ".green+"■".red+"   "+"■".red+"  ║".green if line == 2
				print "║    ".green+"■".red+"    ║".green 					if line == 3
				print "╚═════════╝" .green													if line == 4
			else #the case is checked and the symbol is a cross
				print "╔═════════╗".green																	if line == 0
				print "║  ".green+"■".light_blue+"   "+"■".light_blue+"  ║".green if line == 1
				print "║    ".green+"■".light_blue+"    ║".green 									if line == 2
				print "║  ".green+"■".light_blue+"   "+"■".light_blue+"  ║".green if line == 3
				print "╚═════════╝".green																	if line == 4
			end
		end
	end
	def select_case
		@selected = true
	end
	def unselect_case
		@selected = false
	end
	def is_free?
		return !case_checked
	end

end