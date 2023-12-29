module NameService
    def changeName(newName)
        # 不適切な名前はエラー
        if newName == "うんこ"
            puts "不適切な名前です"
            return
        end
        @name = newName
    end

    def getName
        return @name
    end
end