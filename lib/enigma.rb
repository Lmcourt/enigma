require 'date'

class Enigma

  def random_num
    5.times.map do
      rand(0..9)
    end.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = random_num, date = todays_date)
    encrypts = Cryption.new(key, date)
    encrypted = {
      encryption: encrypts.encrypt(message),
      key: key,
      date: date
    }
  end

  def decrypt(message, key = random_num, date = todays_date)
    decrypts = Cryption.new(key, date)
    decrypted = {
      encryption: decrypts.decrypt(message),
      key: key,
      date: date
    }
  end
end
