require_relative './lib/oystercard.rb'

oystercard = Oystercard.new
p oystercard.balance

oystercard.top_up(50)
p oystercard.balance
# expect £10

# oystercard.top_up(100)
# expect runtime error

oystercard.deduct
p oystercard.balance
########################
p oystercard.in_journey?

p oystercard.touch_in
# expect "Beep"

p oystercard.in_journey?
# expect true

# oystercard.touch_in
# expect error

oystercard.touch_out
p oystercard.touch_out
# expect "Boop"

oystercard.touch_out
# want to deduct fare

oystercard.in_journey?
p oystercard.in_journey?
# expect false

oystercard2 = Oystercard.new
p oystercard2.touch_in
# expect FUCK OFF
