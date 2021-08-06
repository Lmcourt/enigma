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
end
