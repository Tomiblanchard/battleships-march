require 'sinatra/base'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

class Battleships < Sinatra::Base

  # set public folder as well

  GAME = Game.new

  get '/' do
    erb :homepage
  end

  get '/new_game' do
    erb :new_game
  end

  post '/start_game' do
    # Define player_one & player_two
    # {"first_name"=>"mihai"}
    player_one = Player.new(params[:first_name])
    player_two = Player.new("Computer")
    # Define player_one_board and player_two_board
    player_one_board = Board.new({size: 9, cell: Cell, number_of_pieces: 5})
    player_two_board = Board.new({size: 9, cell: Cell, number_of_pieces: 5})
    # assign player_xxx_board to the board method
    player_one.board = player_one_board
    player_two.board = player_two_board
    GAME.add_player player_one
    GAME.add_player player_two
    player_one_board.fill_all_content Water.new
    player_one_board.fill_all_content Water.new
    p GAME

    @board = player_one.board.grid
    @player_two_board = GAME.player_1.board.grid
    erb :place_ship
  end

  post '/place_ship' do
    p GAME
    GAME.player_1.board.place_ship Ship.new, params[:ship_coord].to_sym
    @board = GAME.player_1.board.grid
    GAME.player_2.board.place Ship.new, GAME.player_2.board.grid.keys.sample
    @player_two_board = GAME.player_1.board.grid
    erb :place_ship
  end


#   def random_coord
#   board.grid.keys.sample
#   end
#
# => def receive_shot(random_coord)
# => end
#

  # start the server if ruby file executed directly
run! if app_file == $0
end
