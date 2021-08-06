require 'date'
require './lib/enigma'

RSpec.describe Enigma do

  it 'exists' do
    enigma = Enigma.new
  end

  it 'generates a random key' do
    enigma = Enigma.new

    allow(enigma).to receive(:random_num).and_return('94860')

    expect(enigma.random_num).to eq('94860')
  end

  it 'generates todays date' do
    enigma = Enigma.new
    # allow(enigma).to receive(:todays_date).and_return('060821')

    expect(enigma.todays_date).to eq('060821')
  end
end
