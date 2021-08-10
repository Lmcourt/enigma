require 'date'

class Enigma

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def random_num
    5.times.map do
      rand(0..9)
    end.join
  end

  def encrypt(message, key = random_num, date = todays_date)
    encrypts = Cryption.new(key, date)
    {
      encryption: encrypts.encrypt(message),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = todays_date)
    decrypts = Cryption.new(key, date)
    {
      decryption: decrypts.decrypt(message),
      key: key,
      date: date
    }
  end
end
