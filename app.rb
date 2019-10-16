require 'bundler'
Bundler.require


require_relative "lib/board"
require_relative "lib/boardcase"
require_relative "lib/game"
require_relative "lib/application"


#Game.new.perform

		puts "╔═════════╗" 
		puts "║    "+"■".red+"    ║" 
		puts "║  "+"■".red+"   "+"■".red+"  ║" 
		puts "║    "+"■".red+"    ║" 
		puts "╚═════════╝"


		puts "╔═════════╗" 
		puts "║  "+"■".light_blue+"   "+"■".light_blue+"  ║" 
		puts "║    "+"■".light_blue+"    ║" 
		puts "║  "+"■".light_blue+"   "+"■".light_blue+"  ║" 
		puts "╚═════════╝"



		print "╔═════════╗".green
		print "╔═════════╗".green
		puts "╔═════════╗".green

		5.times do |n|
			puts n
			
		end