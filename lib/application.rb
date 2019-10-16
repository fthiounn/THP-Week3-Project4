#SPECIFICATIONS class Application

# ¿WHY?
#Cette classe gere les boucles de jeu

#fonctions :
# => update player info
# => handles a game



class Application
	attr_accessor :player1, :player2, :game_board, :user_exit
	def initialize (player1, player2)
		@player1 = player1
		@player2 = player2
		@game_board = Board.new
		@user_exit = false
	end
	#boucle de jeu
	def perform
		while !@game_board.is_over? && !@user_exit do
			system 'clear'
			puts "\n\n"
			puts "\tThe rules are simple : "
			puts "\tSelect a square with the arrows and play it by pressing 'p'"
			puts "\n\n"
			print_board
			if @game_board.whos_turn_is_it? == @player1.circle_or_cross then
				print "\n\tIt's #{@player1.name}'s turn ! (playing "
				((@player1.circle_or_cross)? (print "Red)") : (print "Blue)"))
			else
				print "\n\tIt's #{@player2.name}'s turn ! (playing "
				((@player2.circle_or_cross)? (print "Red)") : (print "Blue)"))
			end
			puts
			puts "\tBtw you can always go back to main menu by pressing 'q'"
			process_action(read_char)
		end
		display_match_result
	end

	private

	def display_match_result
		system 'clear'
		tmp = @game_board.who_won?
		if tmp.nil? then
			match_draw
			return
		end
		match_won(tmp) 
	end
	def match_draw
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\t---   DRAW   ---".green
		sleep(3)
	end
	def match_won(tmp)
		if(@player1.circle_or_cross == tmp)
			@player1.score +=1
			puts "\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tPlayer #{@player1.name} won!".green
		else
			@player2.score +=1
			puts "\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tPlayer #{@player2.name} won!".green
		end
		sleep(3)
	end
	def process_action(input)
		case input
	  when "p"#selection
	  	if @game_board.whos_turn_is_it? == @player1.circle_or_cross then
	  		@game_board.check_current_case(@player1)
	  	elsif @game_board.whos_turn_is_it? == @player2.circle_or_cross then
	  		@game_board.check_current_case(@player2)
	  	end
	  when "\e[A"#up
	  	@game_board.change_selection(0)
	  when "\e[B"#down
	  	@game_board.change_selection(2)
	  when "\e[C"#right
	  	@game_board.change_selection(1)
	  when "\e[D"#left
	  	@game_board.change_selection(3)
	  when "q"
	  	@user_exit = true
	  else 
	  	puts "move with arrow and confirm with 's"
	  end
			
	end
	#this function allows me to get the ARROWS keystrokes
	def read_char
	  STDIN.echo = false
	  STDIN.raw!

	  input = STDIN.getc.chr
	  if input == "\e" then
	    input << STDIN.read_nonblock(3) rescue nil
	    input << STDIN.read_nonblock(2) rescue nil
	  end
	ensure
	  STDIN.echo = true
	  STDIN.cooked!
	  return input
	end
	def print_board
		@game_board.print_board
	end
end