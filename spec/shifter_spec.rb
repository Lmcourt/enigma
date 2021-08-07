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

  it 'has an A key' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.a_key).to eq("12")
  end

  it 'has an B key' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.b_key).to eq("23")
  end
  it 'has an C key' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.c_key).to eq("34")
  end
  it 'has an D key' do
    shifter = Shifter.new("12345", '060821')
    expect(shifter.d_key).to eq("45")
  end
end
