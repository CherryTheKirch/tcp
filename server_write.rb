require 'socket'

Socket.tcp_server_loop(4481) do |conn|
  conn.write 'Welcome'
  conn.close
end
