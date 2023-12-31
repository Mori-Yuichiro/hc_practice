require_relative "./pikachu"

pokemon = Pokemon.new("ゼニガメ", "水", "", 500)
pikachu = Pikachu.new("ピカチュウ", "", "", 1000)

puts pikachu.getName
pikachu.attack
puts pokemon.getName
pokemon.changeName("うんこ")
puts pokemon.getName