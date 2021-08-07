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

  
end
