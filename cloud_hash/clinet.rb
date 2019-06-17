require 'socket'

module CloudHash
  class Client
    class << self
      attr_accessor :host, :port
    end

    def self.get(key)
      request "GET #{key}"
    end

    def self.set(key, value)
      request "SET #{key} #{value}"
    end

    def self.request(string)
      @client = TCPSocket.new(host, port)
      @client.write(string)

      # Sent EndOfFile after writing the request
      @client.close_write

      # Read until EOF to get response
      @client.read
    end
  end
end

CloudHash::Client.host = 'localhost'
CloudHash::Client.port = 4481

puts CloudHash::Client.set 'prez', 'cherryt'
puts CloudHash::Client.get 'prez'
puts CloudHash::Client.get 'pbp'
puts CloudHash::Client.set 'noob', 'someone'
puts CloudHash::Client.get 'noob'
