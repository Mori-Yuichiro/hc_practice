require_relative "./suica"
require_relative "./juice"


# 自動販売機クラス
class VendingMachine
    def initialize
        suica = Suica.new
        pepsi_data = Juice.new("pepsi", 150)
        monster_data = Juice.new("monster", 230)
        irohasu_data = Juice.new("irohasu", 120)
        # 残高
        @deposit = suica.deposit

        # 飲み物を五本ずつ格納
        @stock = {
            {pepsi_data.name=>pepsi_data.price} => 5,
            {monster_data.name=>monster_data.price} => 5,
            {irohasu_data.name=>irohasu_data.price} => 5
        }
        # 売り上げ
        @sales = 0
    end

    # 在庫を取得
    def stock
        stock_value = @stock.values
        "ペプシ: #{stock_value[0]}, モンスター: #{stock_value[1]}, いろはす: #{stock_value[2]}"
    end

    # 購入処理
    def buy(juice_hash)
        # 残高が値段以上で在庫がある場合
        if juice_hash.values[0] <= @deposit && @stock[juice_hash] != 0
            @deposit -= juice_hash.values[0]
            @stock[juice_hash] -= 1
            add_sales(juice_hash.values[0])
        else
            raise "購入できません。在庫:#{@stock[juice_hash]}, 残高: #{@deposit}"
        end

        "残高:#{@deposit}, 在庫:#{@stock[juice_hash]} , 売り上げ:#{@sales} "
    end

    # 購入可能なドリンクのリスト
    def list
        buy_list = []
        @stock.each do |juice_hash, juice_stock|
            # 在庫が1個以上であれば表示するリストに追加
            buy_list << juice_hash.keys[0] if juice_stock > 0
        end
        buy_list
    end

    # 在庫を補充
    def add_juice(juice_hash)
        @stock[juice_hash] += 1
    end

    # 売り上げを追加
    private
    def add_sales(price)
        @sales += price
    end
end