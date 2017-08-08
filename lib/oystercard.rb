class Oystercard

  MAX_BAL = 90
  FARE = 2
  PENALTY_FARE = 10
  attr_reader :balance, :status, :entry_station

  def initialize
    @balance = 0
    @fare = FARE
    @penalty_fare = PENALTY_FARE
    @entry_station = nil
  end

  def top_up(amount)
    raise "Balance cannot exceed £90" if max?(amount)
    @balance += amount
  end

  def touch_in(stn)
    raise "Fuck" if in_journey?
    raise "FUCK OFF" if @balance < 1
    @entry_station = stn
    "Beep"
  end

  def touch_out
    @entry_station = nil
    deduct
    "Boop"
  end

  def in_journey?
    !!@entry_station
  end

  def max?(amt)
    @balance + amt > MAX_BAL
  end

  def deduct
    @balance -= @fare
  end

  private :max?, :deduct

end
