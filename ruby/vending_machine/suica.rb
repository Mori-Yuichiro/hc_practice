# Suicaクラス
class Suica
    def initialize(deposit=500)
        @deposit = deposit
    end

    #残高取得
    def deposit
        @deposit
    end

    # 残高チャージする
    private
    def charge_deposit(charge)
        if charge >= 100
            @deposit += charge
        else
            raise "チャージ可能金額は100円以上です。"
        end
    end
end