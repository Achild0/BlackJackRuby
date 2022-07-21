require 'socket'

def hostGame()

    server = TCPServer.open(2000)
    loop {
        Thread.start(server.accept) do |client|
            client.puts "Hello dear client !"
            sleep(5)
            client.puts "ohh i slept well !"
            client.puts "Client, have you something to say ?"
            client.puts "OUT"
            sleep(1)
            puts client.gets.chop
            client.puts "Ok, it was fun. bye"
            client.close
        end
    }

end

def clientGame()
    hostname = 'localhost'
    port = 2000

    begin
        s = TCPSocket.open(hostname, port)
    rescue Exception => e
        puts e.to_s
        puts "DEBUG : Error on connexion, sleeping 5 ans rety" #DEBUG
        sleep(5)
        retry
    end

    while line = s.gets
        puts line.chop
        if line.chop == "OUT"
            outline = gets.chomp
            s.puts outline
        end    
    end
    s.close
end