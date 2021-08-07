class Shifter

  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def keys
    a = @key.split("")
    a.each_cons(2).map do |num|
      num.join
    end
  end

  def date_squared
    @date.to_i ** 2
  end

  def offsets
    date_squared.to_s[-4..-1].split("")
  end

  def shifts
    shifts = {}
    shifts[:A] = (offsets[0].to_i + keys[0].to_i)
    shifts[:B] = (offsets[1].to_i + keys[1].to_i)
    shifts[:C] = (offsets[2].to_i + keys[2].to_i)
    shifts[:D] = (offsets[3].to_i + keys[3].to_i)
    shifts
  end

  def characters
    ("a".."z").to_a << " "
  end

  # def rotate(letter)
  #   alpha_array.rotate(shifts[letter])
  # end

  def encrypt(message)
    new_message = []
    message.each_char.with_index do | letter, i|
      idx = characters.index(letter)
      if characters.include?(letter)
        if i % 4 == 0
          a_idx = (idx + shifts[:A]) % characters.length
          new_message << characters[a_idx]
        elsif
          i % 4 == 1
          b_idx = (idx + shifts[:B]) % characters.length
          new_message << characters[b_idx]
        elsif
          i % 4 == 2
          c_idx = (idx + shifts[:C]) % characters.length
          new_message << characters[c_idx]
        elsif
          i % 4 == 3
          d_idx = (idx + shifts[:D]) % characters.length
          new_message << characters[d_idx]
        end
      else
        new_message << letter
      end
      # require "pry"; binding.pry
      new_message.join
    end
  end
end
