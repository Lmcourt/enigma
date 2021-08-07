require './lib/shifter'
require './lib/enigma'
require 'simplecov'
SimpleCov.start

RSpec.describe Shifter do

  it 'exists' do
    shifter = Shifter.new("12345", "060821")
    expect(shifter).to be_a(Shifter)
  end

  it 'has attributes' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.key).to eq("12345")
    expect(shifter.date).to eq('060821')
  end

  it 'has keys' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.keys).to eq(["12", "23", "34", "45"])
  end

  it 'squares the date' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.date_squared).to eq(3699194041)
  end

  it 'takes last four digets of date squared' do
    shifter = Shifter.new("12345", '060821')

    expect(shifter.offsets).to eq(["4", "0", "4", "1"])
  end

  it 'sums key and offset to get shifts' do
    shifter = Shifter.new("12345", '060821')

    expect(shifter.shifts).to eq({ :A => 16, :B => 23, :C => 38, :D => 46})
  end

  it 'has an alphabet array' do
    shifter = Shifter.new("12345", '060821')

    expect(shifter.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'encrypts the message' do
    shifter = Shifter.new("02715", '040895')
    expect(shifter.encrypt("hello world")).to eq("keder ohulw")
  end

  it 'decrypts the message' do
    shifter = Shifter.new("02715", '040895')
    expect(shifter.decrypt("keder ohulw")).to eq("hello world")
  end

end
