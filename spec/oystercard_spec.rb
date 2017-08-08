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

  it 'limits the amount of balance on the card to £90' do
    expect { oystercard.top_up(90) }.not_to raise_error
  end

  it 'limits the amount of balance on the card to £91' do
    expect { oystercard.top_up(91) }.to raise_error "Balance cannot exceed £90"
  end

  it 'deducts fare amount from balance' do
    oystercard.top_up(50)
    old_bal = oystercard.balance
    oystercard.deduct(2)
    new_bal = oystercard.balance
    expect(new_bal).to eq(old_bal - 2)
  end

end
