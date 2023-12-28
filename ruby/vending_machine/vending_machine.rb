require_relative "./suica"
require_relative "./juice"


# 自動販売機クラス
class VendingMachine
    def initialize
        # suica = Suica.new
        pepsi_data = Juice.new("pepsi", 150)
        monster_data = Juice.new("monster", 230)
        irohasu_data = Juice.new("irohasu", 120)

        # 飲み物を五本ずつ格納
        @stock = []
        5.times {
            @stock << pepsi_data
            @stock << monster_data
            @stock << irohasu_data
        }
        # 売り上げ
        @sales = 0
    end

    # 在庫を取得
    def stock
        "ペプシ: #{countStock(@stock, "pepsi")}, モンスター: #{countStock(@stock, "monster")}, いろはす: #{countStock(@stock, "irohasu")}"
    end

    # 購入処理
    def buy(juice_name, suica)
        # 選択したジュースのインスタンスを格納
        selected_juice = @stock.find {|juice| juice.name == juice_name }
        name = selected_juice.nil? ? "" : selected_juice.name
        price = selected_juice.nil? ? 0 : selected_juice.price
        
        # 残高が値段以下もしくは在庫がない場合
        raise "購入できません。残高: #{suica.deposit}" if suica.deposit < price
        raise "購入できません。在庫:#{countStock(@stock, name)}" if selected_juice.nil?

        # 支払い、在庫を減らす、売り上げを増やす
        suica.pay(price)
        delJuice(selected_juice)
        add_sales(price)

        "残高:#{suica.deposit}, 在庫:#{countStock(@stock, name)} , 売り上げ:#{@sales} "
    end

    # 購入可能なドリンクのリスト
    def list
        buy_list = []
        @stock.each do |juice|
            buy_list << juice.name
        end
        #重複を消す
        buy_list.uniq
    end

    # 在庫を補充
    def add_juice(juice_name)
        #補充可能なジュースのリスト
        temp_stock = @stock.uniq
        temp_stock.each do |temp|
            if temp.name == juice_name
                @stock << temp
            end
        end
    end

    private
    # 売り上げを追加
    def add_sales(price)
        @sales += price
    end

    # @stockからJuiceインスタンスを削除
    def delJuice(juice)
        @stock.delete_at(@stock.index(juice))
    end

    #在庫数を数える
    def countStock(stock_array, juice_name)
        stock_hash =stock_array
                    .group_by(&:itself)
                    .map{|key, value| [key.name, value.count]}.to_h
        count = stock_hash[juice_name].nil? ? 0 : stock_hash[juice_name]
        count
    end
end