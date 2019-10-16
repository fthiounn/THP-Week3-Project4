#SPECIFICATIONS class Game

# ¿WHY?
#Cette classe gère le menu principal et les choix de l'utilisateur; 

#fonctions :
# => afficher l'accueil et le menu principal
# => lance l'application avec les bons arguments

class Game
	attr_accessor :player1, :player2, :application
	def initialize
		@player1 = Player.new("player1", true)
		@player2 = Player.new("player2", false)
	end

	def perform
		display_menu_acceuil
		display_menu_user
		
		game_loop

		display_goodbye
	end

	private
	def game_loop
		user_input = 0
		display_game_menu

		while user_input < 1 || user_input > 5 do
			print "                                > "
			user_input = gets.to_i
		end

		case user_input
			when 1# launch game
				@application = Application.new(@player1,@player2)
				@application.perform
				game_loop
				return
			when 2#invert starting player
				@player1.circle_or_cross = !@player1.circle_or_cross
				@player2.circle_or_cross = !@player2.circle_or_cross
				game_loop
				return
			when 3#change player name
				display_menu_user
				game_loop
				return
			when 4#reset score
				@player1.score = 0
				@player2.score = 0
				game_loop
				return
			when 5#quit
				return
			else
				puts "hey chief, error with user_input in the game_loop of class Game"
				game_loop
			end
	end
	#menu d'acceuil - press enter to play a game
	def display_menu_acceuil
		system 'clear'
		puts "          /\\  ________ \\ "
		puts "         /  \\ \\______/\\ \\ "
		puts "        / /\\ \\ \\  / /\\ \\ \\ "
		puts "       / / /\\ \\ \\/ / /\\ \\ \\ "
		puts "      / / /__\\ \\ \\/_/__\\_\\ \\__________ "
		puts "     / /_/____\\ \\__________  ________ \\ "
		puts "     \\ \\ \\____/ / ________/\\ \\______/\\ \\ "
		puts "      \\ \\ \\  / / /\\ \\  / /\\ \\ \\  / /\\ \\ \\ "
		puts "       \\ \\ \\/ / /\\ \\ \\/ / /\\ \\ \\/ / /\\ \\ \\ "
		puts "        \\ \\/ / /__\\_\\/ / /__\\ \\ \\/_/__\\_\\ \\ "
		puts "         \\  /_/______\\/_/____\\ \\___________\\ "
		puts "         /  \\ \\______/\\ \\____/ / ________  / " 
		puts "        / /\\ \\ \\  / /\\ \\ \\  / / /\\ \\  / / / "
		puts "       / / /\\ \\ \\/ / /\\ \\ \\/ / /\\ \\ \\/ / / "
		puts "      / / /__\\ \\ \\/_/__\\_\\/ / /__\\_\\/ / / "
		puts "     / /_/____\\ \\_________\\/ /______\\/ / "
		puts "     \\ \\ \\____/ / ________  __________/ "
		puts "      \\ \\ \\  / / /\\ \\  / / / "
		puts "       \\ \\ \\/ / /\\ \\ \\/ / / "
		puts "        \\ \\/ / /__\\_\\/ / /   Welcome to François' "
		puts "         \\  / /______\\/ /		 Tic Tac Toe ! "
		puts "          \\/___________/    "
		puts
		puts "          Press Enter to continue"
		gets
	end
	#menu de choix de nom pour les utilisateurs 
	def display_menu_user
		system 'clear'
		puts "\n\n\n\n\n\n\n\n\n"
		puts "                      Let's get started !"
		puts "                      First lets give a name to Player1"
		print "                      > "
		@player1.name = gets.chomp
		puts "                      Now, lets give a name to Player2"
		print "                      > "
		@player2.name = gets.chomp
		puts 
		puts "                      Great ! lets start the game :)"
		sleep(2)
	end
	def display_game_menu
		system "clear"
		puts "\n\n\n"
		puts "                          G A M E      M E N U\n\n\n\n"
		puts "	 Player 1                              \t\tPlayer 2\n"
		puts "	 #{@player1.name}                      \t\t\t#{@player2.name}"
		print "  	 Playing as :"
		((@player1.circle_or_cross)? (print "Red") : (print "Blue"))
		print "                      \t\tPlaying as :"
		((@player2.circle_or_cross)? (puts "Red") : (puts "Blue")) 
		puts "	 #{@player1.score} victories                       \t\t#{@player2.score} victories \n\n\n"
		puts
		puts "                 In François's Tic Tac Toe, Red Starts\n" 
		puts
		puts "                   1. Launch game with parameters"
		puts "                      2. Change Starting player"
		puts "                        3. Change Players name"
		puts "                           4. Reset scores"
		puts "                               5. Quit"
	end 
	def display_goodbye
		puts "implement the goodbye screen you lazy fuck"
	end
end