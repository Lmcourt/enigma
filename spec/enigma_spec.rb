require 'date'
require './lib/enigma'
require 'simplecov'
SimpleCov.start

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  it 'generates a random key' do
    enigma = Enigma.new
    allow(enigma).to receive(:random_num).and_return('94860')

    expect(enigma.random_num).to eq('94860')
  end

  it 'generates todays date' do
    enigma = Enigma.new
    allow(enigma).to receive(:todays_date).and_return('060821')

    expect(enigma.todays_date).to eq('060821')
  end

  it 'encrypts with key and date' do
    enigma = Enigma.new

    expected = {
    encryption: "keder ohulw",
     key: "02715",
    date: "040895"
    }
    
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'decrypts with key and date' do
    enigma = Enigma.new

    expected = {
    decryption: "hello world",
     key: "02715",
    date: "040895"
    }

    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'encrypts a message with a key (uses todays date)' do
    enigma = Enigma.new
    allow(enigma).to receive(:todays_date).and_return('040895')

    expected = {
    encryption: "keder ohulw",
     key: "02715",
    date: '040895'
    }

    expect(enigma.encrypt("hello world", "02715")).to eq(expected)
  end

  it 'decrypts a message with a key (uses todays date)' do
    enigma = Enigma.new
    allow(enigma).to receive(:todays_date).and_return('040895')

    expected = {
    decryption: "hello world",
     key: "02715",
    date: '040895'
    }

    expect(enigma.decrypt("keder ohulw", "02715")).to eq(expected)
  end

  it 'encrypts a message (generates random key and uses todays date)' do
    enigma = Enigma.new
    allow(enigma).to receive(:todays_date).and_return('040895')
    allow(enigma).to receive(:random_num).and_return('12345')

    expected = {
    encryption: "uauhawekdhm",
     key: "12345",
    date: '040895'
    }

    expect(enigma.encrypt("hello world")).to eq(expected)
  end
end
