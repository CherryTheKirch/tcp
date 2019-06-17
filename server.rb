require 'socket'

one_hundred_kb = 1024 * 100

Socket.tcp_server_loop(4481) do |conn|
  begin
    while data = conn.readpartial(one_hundred_kb)
      puts data
    end
  rescue EOFError
  end
  conn.close
end
