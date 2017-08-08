require 'oystercard'

describe Oystercard do

  let(:oystercard) { described_class.new }

  it 'initializes with a zero balance' do
    expect(oystercard.balance).to eq 0
  end

  it 'allows a topup' do
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end

  it 'registers a ten pound topup in the balance' do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq 10
  end

end
