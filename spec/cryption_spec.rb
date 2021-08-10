require './lib/cryption'
require 'spec_helper'

RSpec.describe Cryption do
  it 'exists' do
    crypt = Cryption.new("02715", '040895', "hello world")

    expect(crypt).to be_a(Cryption)
  end

  it 'has attributes' do
    crypt = Cryption.new("02715", '040895', "hello world")

    expect(crypt.key).to eq("02715")
    expect(crypt.date).to eq("040895")
    expect(crypt.message).to eq("hello world")
  end

  it 'has keys' do
    crypt = Cryption.new("02715", '040895', "hello world")

    expected = [2, 27, 71, 15]

    expect(crypt.keys).to eq(expected)
  end

  it 'has date_squared' do
    crypt = Cryption.new("02715", '040895', "hello world")

    expect(crypt.date_squared).to eq(1672401025)
  end

  it 'has offsets' do
    crypt = Cryption.new("02715", '040895', "hello world")

    expect(crypt.offsets).to eq([1, 0, 2, 5])
  end

  it 'has shifts' do
    crypt = Cryption.new("02715", '040895', "Hello world")

    expect(crypt.shifts).to eq({ :A => 3, :B => 27, :C => 73, :D => 20})
  end

  it 'has characters' do
    crypt = Cryption.new("02715", '040895', "hello world")

    expect(crypt.chars).to eq(("a".."z").to_a << " ")
  end

  it 'encrypts' do
    crypt1 = Cryption.new("02715", '040895', "Hello world")
    crypt2 = Cryption.new("02715", '040895', "hello world")
    crypt3 = Cryption.new("02715", '040895', "Hello world!")


    expect(crypt1.encrypt).to eq("keder ohulw")
    expect(crypt2.encrypt).to eq("keder ohulw")
    expect(crypt3.encrypt).to eq("keder ohulw!")
  end

  it 'decrypts' do
    crypt = Cryption.new("02715", '040895', "keder ohulw")

    expect(crypt.decrypt).to eq("hello world")
  end
end
