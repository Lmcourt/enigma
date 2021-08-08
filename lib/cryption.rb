require './lib/shifter'
class Cryption

  include Shifter
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def encrypt(message)
    message.each_char.with_index.map do |letter, i|
      idx = characters.index(letter)
      if characters.include?(letter)
          a_idx = (idx + shifts.values[i % 4]) % characters.length
          characters[a_idx]
      else
        letter
      end
    end.join
  end
  
  def decrypt(message)
    message.each_char.with_index.map do |letter, i|
      idx = characters.index(letter)
      if characters.include?(letter)
          a_idx = (idx - shifts.values[i % 4]) % characters.length
          characters[a_idx]
      else
        letter
      end
    end.join
  end
end
