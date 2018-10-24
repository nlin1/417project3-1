require 'socket'
require 'csv'

$port = nil
$hostname = nil
$socketToNode = {} #Hashmap to index node by socket
$nodeToSocket = {}


#dst -> nexthop, dist
routing_table = Hash.new


# --------------------- Part 1 --------------------- # 

def edgeb(cmd)
	if(routing_table.has_key?(cmd[2]) && routing_table[cmd[2]][1] == 1)
		return nil
	else
		routing_table[cmd[2]] = [cmd[2], 1]
	end
	sock = TCPSocket.open()

end

def dumptable(cmd)
	STDOUT.puts "DUMPTABLE: not implemented"
end

def shutdown(cmd)
	STDOUT.flush
	STDERR.flush
	server.close
	exit(0)
end



# --------------------- Part 2 --------------------- # 
def edged(cmd)
	STDOUT.puts "EDGED: not implemented"
end

def edgeu(cmd)
	STDOUT.puts "EDGEu: not implemented"
end

def status()
	STDOUT.puts "STATUS: not implemented"
end


# --------------------- Part 3 --------------------- # 
def sendmsg(cmd)
	STDOUT.puts "SENDMSG: not implemented"
end

def ping(cmd)
	STDOUT.puts "PING: not implemented"
end

def traceroute(cmd)
	STDOUT.puts "TRACEROUTE: not implemented"
end

# --------------------- Part 4 --------------------- # 


def ftp(cmd)
	STDOUT.puts "FTP: not implemented"
end

def circuit(cmd)
	STDOUT.puts "CIRCUIT: not implemented"
end




# do main loop here.... 
def main()

	while(line = STDIN.gets())
		line = line.strip()
		arr = line.split(' ')
		cmd = arr[0]
		args = arr[1..-1]
		case cmd
		when "EDGEB"; edgeb(args) #part 0
		when "EDGED"; edged(args)
		when "EDGEU"; edgeU(args)
		when "DUMPTABLE"; dumptable(args) #part 0
		when "SHUTDOWN"; shutdown(args)	#part0
		when "STATUS"; status()
		when "SENDMSG"; sendmsg(args)
		when "PING"; ping(args)
		when "TRACEROUTE"; traceroute(args)
		when "FTP"; ftp(args);
		when "CIRCUIT"; circuit(args);
		else STDERR.puts "ERROR: INVALID COMMAND \"#{cmd}\""
		end
	end

end

def setup(hostname, port, nodes, config)
	$hostname = hostname
	$port = port

	#set up ports, server, buffers

	server = TCPServer.open(port)

	$socketToNode[server] = hostname;
	$nodeToSocket[hostname] = server;

	main()

end

setup(ARGV[0], ARGV[1], ARGV[2], ARGV[3])