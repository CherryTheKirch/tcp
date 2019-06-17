require 'socket'
# Cherry's server
module CloudHash
  class Server
    # Init
    def initialize(port)
      # Uderserver
      @server = TCPServer.new port
      puts "Listening on port: #{@server.local_address.ip_port}"
      @storage = {}
    end

    # Server starts
    def start
      Socket.accept_loop(@server) do |conn|
        handle(conn)
        conn.close
      end
    end

    # Connection handilng
    def handle(conn)
      # Input handling
      request = conn.read

      # Output handling
      conn.write process(request)
    end

    # Support:
    # SET key value
    # GET key
    def process(request)
      command, key, value = request.split

      case command.upcase
      when 'GET'
        @storage[key]
      when 'SET'
        @storage[key] = value
      end
    end
  end
end

server = CloudHash::Server.new 4481
server.start
