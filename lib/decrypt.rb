require './lib/enigma'
require './lib/cryption'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
decrypt = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])

puts "Created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"

writer = File.open(ARGV[1], "w")
writer.write(decrypt[:decryption])
writer.close
