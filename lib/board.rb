#SPECIFICATIONS Class Board
# ¿WHY?
# This class represents a bame board. handles the board cases
# functions :
# => check who is the winner and if the game is still ongoing
# => handles the boardcases states (selection, check and if its free)
# => prints the board
class Board
	attr_accessor :board_array, :current_turn, :selection
	#constructor
	def initialize
		@current_turn = 1
		@selection = []
		@board_array = []
		3.times do |row|
			@board_array[row]=[]
			3.times do |col|
			@board_array[row][col] = BoardCase.new
			end
		end
		@selection[0]= 0
		@selection[1]= 0
		select_current
	end
	#end-game check
	def is_over?
		return true if @current_turn == 10 || !who_won?.nil?
		return false
	end
	#name of the winner
	#returns TRUE if winner is circle
	#return FALSE if winner is Cross
	#return nill if no one still won on the board (check turn limit)
	def who_won?
		#check for winner in rows and cols
		3.times do |n|
			if !@board_array[n][0].is_free? && !@board_array[n][1].is_free? && !@board_array[n][2].is_free? then
				if ( !@board_array[n][0].get_sign == !@board_array[n][1].get_sign ) && ( !@board_array[n][1].get_sign == !@board_array[n][2].get_sign ) then
					return @board_array[n][0].get_sign
				end
			end
			if !@board_array[0][n].is_free? && !@board_array[1][n].is_free? && !@board_array[2][n].is_free? then
				if (!@board_array[0][n].get_sign == !@board_array[1][n].get_sign) && ( !@board_array[1][n].get_sign == !@board_array[2][n].get_sign ) then
					return @board_array[0][n].get_sign
				end
			end
		end
		#check for winner in diagonals
		if !@board_array[0][0].is_free? && !@board_array[1][1].is_free? && !@board_array[2][2].is_free? then
			if ( !@board_array[0][0].get_sign == !@board_array[1][1].get_sign ) && ( !@board_array[1][1].get_sign == !@board_array[2][2].get_sign ) then
				return @board_array[0][0].get_sign
			end
		end
		if !@board_array[0][2].is_free? && !@board_array[1][1].is_free? && !@board_array[2][0].is_free? then
			if ( !@board_array[0][2].get_sign == !@board_array[1][1].get_sign ) && ( !@board_array[1][1].get_sign == !@board_array[2][0].get_sign ) then

				return @board_array[0][2].get_sign
			end
		end
		#return nil if nothing was found
		return nil
	end
	def check_current_case (player)
		if @board_array[@selection[0]][@selection[1]].is_free? then
			@board_array[@selection[0]][@selection[1]].check_case(player)
			@current_turn+=1
		end
	end
	#prints the board line by line
	def print_board
		3.times do |row|
			5.times do |line|
				print "\t\t     "
				@board_array[row][0].print_case(line)
				@board_array[row][1].print_case(line)
				@board_array[row][2].print_case(line)
				puts
			end
		end
	end
	#CHANGE THE SELECTED CASE
	#0 for up
	#1 for right
	#2 for down
	#3 for left
	def change_selection(direction)
		return if direction < 0 || direction > 3
		if direction == 0 then#UP
			if @selection[0] == 0 then#check for top row range
				return
			else
				unselect_current
				@selection[0]-=1
				select_current
				return
			end
		elsif direction == 1#right
			if @selection[1] == 2 then#check for right col range
				return
			else
				unselect_current
				@selection[1]+=1
				select_current
			end
		elsif direction == 2#down
			if @selection[0] == 2 then#check for bottom row range
				return
			else
				unselect_current
				@selection[0]+=1
				select_current
			end
		elsif direction == 3 #left
			if @selection[1] == 0 then#check for left col range
				return
			else
				unselect_current
				@selection[1]-=1
				select_current
			end
		end
	end
	#return true if its circle to play false otherwise
	def whos_turn_is_it?
		return true if @current_turn == 1 || @current_turn == 3 || @current_turn == 5 || @current_turn == 7 || @current_turn == 9
		return false
	end
	#unselect current case
	def unselect_current
		@board_array[@selection[0]][@selection[1]].unselect_case
	end
	#select current case
	def select_current
		@board_array[@selection[0]][@selection[1]].select_case
	end
end