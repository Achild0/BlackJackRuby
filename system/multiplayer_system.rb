require 'socket'

def hostGame()

    server = TCPServer.open(2000)
    puts server.addr(true)
    loop {
        Thread.start(server.accept) do |client|
            client.puts "Connexion Successfull"
            client.puts "DEBUG : Please send me the data i need to create your multi-profile" #DEBUG
            client.puts "PROFILE_DATA"
            response = client.gets.chop
            puts "DEBUG: Response #{response}" #DEBUG
            puts "DEBUG: Received DATA" #DEBUG
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
        case line.chop 
        when "OUT"
            outline = gets.chomp
            s.puts outline
        when "PROFILE_DATA"
            s.puts "Server".hash
        end    
    end
    s.close
end

def searchProfile()

end 