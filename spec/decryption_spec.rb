require './lib/decryption'
require './lib/keyable'

RSpec.describe Decryption do
  it 'exists' do
    decrypt = Decryption.new("02715", '040895')

    expect(decrypt).to be_a(Decryption)
  end

  it 'has characters' do
    decrypt = Decryption.new("02715", '040895')

    expect(decrypt.chars).to eq(("a".."z").to_a << " ")
  end

  it 'has keys' do
    decrypt = Decryption.new("02715", '040895')

    expected = ["02", "27", "71", "15"]

    expect(decrypt.keys("02715")).to eq(expected)
  end

  it 'has date_squared' do
    decrypt = Decryption.new("02715", '040895')

    expect(decrypt.date_squared('040895')).to eq(1672401025)
  end

  it 'has offsets' do
    decrypt = Decryption.new("02715", '040895')

    expect(decrypt.offsets).to eq(["1", "0", "2", "5"])
  end

  it 'has shifts' do
    decrypt = Decryption.new("02715", '040895')

    expect(decrypt.shifts).to eq({ :A => 3, :B => 27, :C => 73, :D => 20})
  end

  it 'decrypts' do
    decrypt = Decryption.new("02715", '040895')
    
    expect(decrypt.decrypt("keder ohulw")).to eq("hello world")
  end
end
