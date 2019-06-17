require 'socket'

socket = TCPSocket.open 'localhost', 3000

puts 'Starting the clinet......'

while message = socket.gets
  message.chomp
end

puts 'Closing the Client'
socket.close
