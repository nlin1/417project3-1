fHandle = File.open("nodes.txt", 'w')

fHandle.write("n1,#{(2000..60000).to_a.sample()}\n")
fHandle.write("n2,#{(2000..60000).to_a.sample()}\n")
fHandle.write("n3,#{(2000..60000).to_a.sample()}\n")
fHandle.write("n4,#{(2000..60000).to_a.sample()}")
