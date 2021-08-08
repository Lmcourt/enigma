require './lib/shifter'
class Encryption

  include Shifter
  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def encrypt(message)
    message.downcase.each_char.with_index.map do |letter, i|
      if chars.include?(letter)
          chars[(chars.index(letter) + shifts.values[i % 4]) % chars.length]
      else
        letter
      end
    end.join
  end
end
