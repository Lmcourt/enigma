require 'date'
# require './keyable'


class Enigma
# include Keyable

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = random_num, date = todays_date)
    encrypts = Encryption.new(key, date)
    {
      encryption: encrypts.encrypt(message),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = todays_date)
    decrypts = Decryption.new(key, date)
    {
      decryption: decrypts.decrypt(message),
      key: key,
      date: date
    }
  end
end
