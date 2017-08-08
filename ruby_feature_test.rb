require_relative './lib/oystercard.rb'

oystercard = Oystercard.new
p oystercard.balance

oystercard.top_up(50)
p oystercard.balance
# expect £10

# oystercard.top_up(100)
# expect runtime error

oystercard.deduct(2)
p oystercard.balance
########################
oystercard.touch_in
p oystercard.touch_in
# expect "Beep"

oystercard.in_journey?
p oystercard.in_journey?
# expect true

oystercard.touch_in
# expect error

oystercard.touch_out
p oystercard.touch_out
# expect "Boop"

oystercard.touch_out
# want to deduct fare

oystercard.in_journey
p oystercard.in_journey
# expect false
