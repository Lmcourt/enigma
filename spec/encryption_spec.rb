require './lib/encryption'
require './lib/shifter'

RSpec.describe Encryption do
  it 'exists' do
    encrypt = Encryption.new("02715", '040895')
    expect(encrypt).to be_a(Encryption)
  end

  it 'encrypts' do
    encrypt = Encryption.new("02715", '040895')
    expect(encrypt.encrypt("hello world")).to eq("keder ohulw")
    expect(encrypt.encrypt("Hello world")).to eq("keder ohulw")
    expect(encrypt.encrypt("Hello world!")).to eq("keder ohulw!")
  end
end
