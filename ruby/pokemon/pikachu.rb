require_relative "./name_service"
require_relative "./pokemon"


class Pikachu < Pokemon
    include NameService

    def initialize(name, type1, type2, hp)
        super
    end

    def attack
        puts "#{getName}の10万ボルト"
    end
end