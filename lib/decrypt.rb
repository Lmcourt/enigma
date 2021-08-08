require './lib/enigma'
require './lib/decryption'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
decrypt = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])
decrypted_text = decrypt[:decryption]

puts "Created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"

writer = File.open(ARGV[1], "w")
writer.write(decrypted_text)
writer.close
