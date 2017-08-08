class Oystercard

  MAX_BAL = 90
  FARE = 2
  PENALTY_FARE = 10
  attr_reader :balance, :status

  def initialize
    @balance = 0
    @status = false
    @fare = FARE
    @penalty_fare = PENALTY_FARE
  end

  def top_up(amount)
    raise "Balance cannot exceed £90" if max?(amount)
    @balance += amount
  end

  def touch_in
    raise "Fuck" if in_journey?
    raise "FUCK OFF" if @balance < 1
    @status = true
    "Beep"
  end

  def touch_out
    @status = false
    deduct
    "Boop"
  end

  def in_journey?
    @status
  end

  def max?(amt)
    @balance + amt > MAX_BAL
  end

  def deduct
    @balance -= @fare
  end

  private :max?, :deduct

end
