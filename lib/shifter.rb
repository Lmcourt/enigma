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
    shifts[:A] = (offsets[0].to_i + keys[0].to_i).to_s
    shifts[:B] = (offsets[1].to_i + keys[1].to_i).to_s
    shifts[:C] = (offsets[2].to_i + keys[2].to_i).to_s
    shifts[:D] = (offsets[3].to_i + keys[3].to_i).to_s
    shifts
  end
end
