require 'sinatra/base'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

class Battleships < Sinatra::Base

  GAME = Game.new

  get '/' do
    erb :homepage
  end

  get '/new_game' do
    erb :new_game
  end

  get '/start_game' do
    erb :place_ship
  end

  post '/start_game' do
    player_one = Player.new(params[:first_name])
    player_two = Player.new("Computer")
    player_one_board = Board.new({size: 9, cell: Cell, number_of_pieces: 1})
    player_two_board = Board.new({size: 9, cell: Cell, number_of_pieces: 1})
    player_one.board = player_one_board
    player_two.board = player_two_board
    GAME.add_player player_one
    GAME.add_player player_two
    player_one_board.fill_all_content Water.new
    player_two_board.fill_all_content Water.new
    p GAME.inspect
    @board = player_one.board.grid
    @player_two_board = GAME.player_1.board.grid

    # redirect '/'
    erb :place_ship
  end

  post '/place_ship' do
    GAME.player_1.board.place Ship.new, params[:ship_coord].to_sym
    @board = GAME.player_1.board.grid
    GAME.player_2.board.place Ship.new, GAME.player_2.board.grid.keys.sample
    @player_two_board = GAME.player_2.board.grid
    erb :place_ship
  end

  # start the server if ruby file executed directly
run! if app_file == $0
end
