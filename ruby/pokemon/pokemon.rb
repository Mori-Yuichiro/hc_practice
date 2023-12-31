require_relative "./interface"
require_relative "./name_service"

class Pokemon
    include NameService
    include Interface
    attr_reader :name, :type1, :type2, :hp

    def initialize(name, type1, type2, hp)
        @name = name
        @type1 = type1
        @type2 = type2
        @hp = hp
    end
end