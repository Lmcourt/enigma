require './lib/enigma'
require './lib/encryption'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
encrypt = enigma.encrypt(incoming_text)

puts "Created 'encrypted.txt' with the key #{encrypt[:key]} and date #{encrypt[:date]}"

writer = File.open(ARGV[1], "w")
writer.write(encrypt[:encryption])
writer.close
