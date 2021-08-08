module Keyable

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

  def random_num
    5.times.map do
      rand(0..9)
    end.join
  end
end
