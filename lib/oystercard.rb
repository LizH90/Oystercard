class Oystercard

  MAX_BAL = 90
  FARE = 2
  PENALTY_FARE = 10
  attr_reader :balance, :status, :entry_station, :history

  def initialize
    @balance = 0
    @fare = FARE
    @penalty_fare = PENALTY_FARE
    @entry_station = nil
    @history = []
  end

  def top_up(amount)
    raise "Balance cannot exceed £90" if max?(amount)
    @balance += amount
  end

  def touch_in(entry_stn)
    raise "Fuck" if in_journey?
    raise "FUCK OFF" if @balance < 1
    @entry_station = entry_stn
    @history << { :entry_stn => entry_stn }
  end

  def touch_out(exit_stn)
    @entry_station = nil
    deduct
    @history[-1][:exit_stn] = exit_stn
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
