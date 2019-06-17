require 'socket'

Socket.tcp_server_loop(4481) do |conn|
  loop do
    begin
      puts conn.read_nonblock(4096) # Max buffer size
    rescue Errno::EAGAIN
      IO.select([conn])
      retry
    rescue EOFError
      break
    end
  end
  conn.close
end
