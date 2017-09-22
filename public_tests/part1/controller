
require 'open3'


$nodes = {}


#pass a command off to the node... 
def cmd_node(arr)
	nname = arr[0]
	
	#check to make sure this is a real node
	if($nodes[nname] == nil)
		puts "ERROR: no such node \"#{nname}\" in simulation"
		return
	end

	cmd = arr[1..-1].join(" ")
	$nodes[nname]["STDIN"].puts cmd

end



# --------------------- CONTROLLER COMMANDS --------------------- #

# give all nodes the signal to terminate and then close the controller
def shutdown()

	$nodes.keys.each{ |nname|
		$nodes[nname]["STDIN"].puts "SHUTDOWN"
	}
	
	sleep(2)

	$nodes.keys.each{ |nname|
		val = $nodes[nname]["WAIT"].value
		if(val != 0)
			exit(-1)
		end
	}

	exit(0)
end



# pass command off to the controller
def cmd_controller(arr)

	cmd = arr[0]

	case cmd
	when "SHUTDOWN"
		shutdown()
	when "SLEEP"
		sleep(arr[1].to_i)
		#no pop

	end



end




def parse_command(arr)
	case arr[0]
	when "NODE"
		cmd_node(arr[1..-1])
	when "CONTROLLER"
		cmd_controller(arr[1..-1])
	end
end


nodes_file = ARGV[0]
config_file = "./config.txt"

fHandle = File.open(nodes_file)
while(line = fHandle.gets())
	arr = line.chomp().split(',')

	node_name = arr[0]
	node_port = arr[1]

	cmd = "ruby ./node.rb #{node_name} #{node_port} #{nodes_file} #{config_file} > console_#{node_name}"

	first_stdin, wait_thr = Open3.pipeline_w(cmd)
	$nodes[node_name] = {}
	$nodes[node_name]["PORT"] = node_port
	$nodes[node_name]["STDIN"] = first_stdin
	$nodes[node_name]["WAIT"] = wait_thr[0]
		
end


while(line = STDIN.gets())
	parse_command(line.strip.split(' '))
end





