$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include? File.dirname(__FILE__)

require "singleton"
require "network/server"
require "game/square"
require "game/user"


module Gawibawibo
  VERSION = "0.1"

  class MainController
    include Singleton
    
    def initialize
      @squre = Game::Square.instance
      @server = Network::Server.instance
    end

    def start_server
      @server.start
    end

    def create_user( conn )
      Game::User.new conn
    end

    
  end


end




if __FILE__ == $0
  gawi = Gawibawibo::MainController.instance
  gawi.start_server
end
