require 'bundler'
Bundler.require


require_relative "lib/board"
require_relative "lib/boardcase"
require_relative "lib/game"
require_relative "lib/application"
require_relative "lib/player"


Game.new.perform