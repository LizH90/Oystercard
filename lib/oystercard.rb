class Oystercard

  MAX_BAL = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance cannot exceed £90" if max?(amount)
    @balance += amount
  end

  def max?(amt)
    @balance + amt > MAX_BAL
  end

  private :max?

end
