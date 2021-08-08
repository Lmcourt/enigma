require './lib/cryption'
require './lib/shifter'

RSpec.describe Cryption do
  it 'exists' do
    crypt = Cryption.new("02715", '040895')
    expect(crypt).to be_a(Cryption)
  end

  it 'encrypts' do
    crypt = Cryption.new("02715", '040895')
    expect(crypt.encrypt("hello world")).to eq("keder ohulw")
  end

  it 'decrypts' do
    crypt = Cryption.new("02715", '040895')
    expect(crypt.decrypt("keder ohulw")).to eq("hello world")
  end
end
