require './lib/cryption'
require './lib/keyable'
require 'spec_helper'

RSpec.describe Cryption do
  it 'exists' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt).to be_a(Cryption)
  end

  it 'has attributes' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.key).to eq("02715")
    expect(crypt.date).to eq("040895")
  end

  it 'has characters' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.chars).to eq(("a".."z").to_a << " ")
  end

  it 'has keys' do
    crypt = Cryption.new("02715", '040895')

    expected = ["02", "27", "71", "15"]

    expect(crypt.keys("02715")).to eq(expected)
  end

  it 'has date_squared' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.date_squared('040895')).to eq(1672401025)
  end

  it 'has offsets' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.offsets).to eq(["1", "0", "2", "5"])
  end

  it 'has shifts' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.shifts).to eq({ :A => 3, :B => 27, :C => 73, :D => 20})
  end

  it 'encrypts' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.encrypt("hello world")).to eq("keder ohulw")
    expect(crypt.encrypt("Hello world")).to eq("keder ohulw")
    expect(crypt.encrypt("Hello world!")).to eq("keder ohulw!")
  end

  it 'decrypts' do
    crypt = Cryption.new("02715", '040895')

    expect(crypt.decrypt("keder ohulw")).to eq("hello world")
  end
end
