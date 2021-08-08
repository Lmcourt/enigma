module Shifter

  def keys(key)
    a = key.split("")
    a.each_cons(2).map do |num|
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

  def characters
    ("a".."z").to_a << " "
  end
end
