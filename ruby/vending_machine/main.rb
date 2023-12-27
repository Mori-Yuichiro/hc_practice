require_relative "./vending_machine"


suica = Suica.new
vending = VendingMachine.new
puts vending.buy("pepsi", suica)
vending.add_juice("pepsi")
vending.add_juice("pepsi")
vending.add_juice("monster")
p vending.list
puts vending.buy("irohasu", suica)
puts vending.stock