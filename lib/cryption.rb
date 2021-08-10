class Cryption

  attr_reader :key, :date, :message
  def initialize(key, date, message)
    @key = key
    @date = date
    @message = message
  end

  def downcased
    @message.downcase
  end

  def keys
    @key.split("").each_cons(2).map do |num|
      num.join.to_i
    end
  end

  def date_squared
    @date.to_i ** 2
  end

  def offsets
    date_squared.digits.reverse[-4..-1]
  end

  def shifts
    shifts = {}
    shifts[:A] = (offsets[0] + keys[0])
    shifts[:B] = (offsets[1] + keys[1])
    shifts[:C] = (offsets[2] + keys[2])
    shifts[:D] = (offsets[3] + keys[3])
    shifts
  end

  def chars
    ("a".."z").to_a << " "
  end

  def encrypt
    downcased.each_char.with_index.map do |letter, i|
      if chars.include?(letter)
        chars[(chars.index(letter) + shifts.values[i % 4]) % chars.length]
      else
        letter
      end
    end.join
  end

  def decrypt
    downcased.each_char.with_index.map do |letter, i|
      if chars.include?(letter)
        chars[(chars.index(letter) - shifts.values[i % 4]) % chars.length]
      else
        letter
      end
    end.join
  end
end
