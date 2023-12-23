require_relative "./vending_machine"


pepsi = {"pepsi"=> 150}
monster = {"monster"=> 230}
irohasu = {"irohasu"=> 120}

vending = VendingMachine.new
puts vending.buy(pepsi)
vending.add_juice(pepsi)
vending.add_juice(pepsi)
vending.add_juice(monster)
p vending.list
puts vending.buy(irohasu)
puts vending.stock