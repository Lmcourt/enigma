require './lib/encryption'
require './lib/keyable'

RSpec.describe Encryption do
  it 'exists' do
    encrypt = Encryption.new("02715", '040895')
    expect(encrypt).to be_a(Encryption)
  end
  it 'has characters' do
    encrypt = Encryption.new("02715", '040895')

    expect(encrypt.chars).to eq(("a".."z").to_a << " ")
  end

  it 'has keys' do
    encrypt = Encryption.new("02715", '040895')

    expected = ["02", "27", "71", "15"]
    expect(encrypt.keys("02715")).to eq(expected)
  end

  it 'has date_squared' do
    encrypt = Encryption.new("02715", '040895')

    expect(encrypt.date_squared('040895')).to eq(1672401025)
  end

  it 'has offsets' do
    encrypt = Encryption.new("02715", '040895')

    expect(encrypt.offsets).to eq(["1", "0", "2", "5"])
  end

  it 'has shifts' do
    encrypt = Encryption.new("02715", '040895')

    expect(encrypt.shifts).to eq({ :A => 3, :B => 27, :C => 73, :D => 20})
  end

  it 'encrypts' do
    encrypt = Encryption.new("02715", '040895')
    expect(encrypt.encrypt("hello world")).to eq("keder ohulw")
    expect(encrypt.encrypt("Hello world")).to eq("keder ohulw")
    expect(encrypt.encrypt("Hello world!")).to eq("keder ohulw!")
  end
end
