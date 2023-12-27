require_relative "./suica"
require_relative "./juice"

DRINK_STOCK = {
    "pepsi" => 5,
    "monster" => 5,
    "irohasu" => 5,
}

# 自動販売機クラス
class VendingMachine
    def initialize
        # suica = Suica.new
        pepsi_data = Juice.new("pepsi", 150)
        monster_data = Juice.new("monster", 230)
        irohasu_data = Juice.new("irohasu", 120)

        # 飲み物を五本ずつ格納
        @stock = [
            pepsi_data,
            monster_data,
            irohasu_data,
        ]

        # 売り上げ
        @sales = 0
    end

    # 在庫を取得
    def stock
        "ペプシ: #{DRINK_STOCK["pepsi"]}, モンスター: #{DRINK_STOCK["monster"]}, いろはす: #{DRINK_STOCK["irohasu"]}"
    end

    # 購入処理
    def buy(juice_name, suica)
        # 選択したジュースのインスタンスを格納
        selected_juice = ""
        @stock.each do |juice|
            if juice.name == juice_name
                selected_juice = juice
            end
        end

        # 残高が値段以下もしくは在庫がない場合
        raise "購入できません。残高: #{suica.deposit}" if suica.deposit < selected_juice.price
        raise "購入できません。在庫:#{DRINK_STOCK[selected_juice.name]}" if DRINK_STOCK[selected_juice.name].zero?
        
        # 残高が値段以上で在庫がある場合
        suica.pay(selected_juice.price)
        DRINK_STOCK[selected_juice.name] -= 1
        #在庫が0になったら@stockから削除
        if DRINK_STOCK[selected_juice] == 0
            delJuice(selected_juice)
        end
        add_sales(selected_juice.price)

        "残高:#{suica.deposit}, 在庫:#{DRINK_STOCK[selected_juice.name]} , 売り上げ:#{@sales} "
    end

    # 購入可能なドリンクのリスト
    def list
        buy_list = []
        @stock.each do |juice|
            buy_list << juice.name
        end
        buy_list
    end

    # 在庫を補充
    def add_juice(juice_name)
        DRINK_STOCK[juice_name] += 1
    end

    # 売り上げを追加
    private
    def add_sales(price)
        @sales += price
    end

    # @stockからJuiceインスタンスを削除
    def delJuice(juice)
        @stock.delete(juice)
    end
end