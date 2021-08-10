class Cryption

  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def keys(key)
    key.split("").each_cons(2).map do |num|
      num.join
    end
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def offsets
    date_squared(date).to_s[-4..-1].split("")
  end

  def shifts
    shifts = {}
    shifts[:A] = (offsets[0].to_i + keys(key)[0].to_i)
    shifts[:B] = (offsets[1].to_i + keys(key)[1].to_i)
    shifts[:C] = (offsets[2].to_i + keys(key)[2].to_i)
    shifts[:D] = (offsets[3].to_i + keys(key)[3].to_i)
    shifts
  end

  def chars
    ("a".."z").to_a << " "
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

  def decrypt(message)
    message.downcase.each_char.with_index.map do |letter, i|
      if chars.include?(letter)
        chars[(chars.index(letter) - shifts.values[i % 4]) % chars.length]
      else
        letter
      end
    end.join
  end
end
