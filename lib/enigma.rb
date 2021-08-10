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
    encrypts = Cryption.new(key, date, message)
    {
      encryption: encrypts.encrypt,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = todays_date)
    decrypts = Cryption.new(key, date, message)
    {
      decryption: decrypts.decrypt,
      key: key,
      date: date
    }
  end
end
