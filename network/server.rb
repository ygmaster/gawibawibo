# -*- coding: utf-8 -*-
require "socket"
require "singleton"
require "network/network_const"
require "gawibawibo"


module Gawibawibo
  module Network
    class Server
      
      include Singleton

      def initialize
        puts "Creating server.."
        @server = TCPServer.new( NetworkConst::HOSTNAME, NetworkConst::PORT )
      end

      def start
        puts "Starting server"
        
        loop do
          Thread.start(@server.accept) do |s|
            accept s
          end
        end

      end


      private
      def accept( socket )
        socket.puts NetworkConst::CONNECTION_OK
        puts "서버 접속완료"
        MainController::instance.create_user socket         
      end
        
      
    end
  end
end
