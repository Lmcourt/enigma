require 'date'

class Enigma

  def random_num
    5.times.map do
      rand(1..9)
    end.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end
end
