class Shifter

  attr_reader :key, :date
  def initialize(key, date)
    @key = key
    @date = date
  end

  def a_key
    a = @key[0..1]
  end

  def b_key
    b = @key[1..2]
  end

  def c_key
    c = @key[2..3]
  end

  def d_key
    d = @key[3..4]
  end

  def date_squared
    @date.to_i ** 2
  end

  def last_four
    date_squared.to_s[-4..-1]
  end
end
