# 規定打数以下のときの結果を表示
def result_under(regulation, result)
    case regulation-result
    when 0
        "パー"
    when 1
        "バーディー"
    when 2
        if regulation == 3
            "ホールインワン"
        else
            "イーグル"
        end
    when 3
        if regulation == 4
            "ホールインワン"
        else
            "アルバトロス"
        end
    when 4
        "コンドル"
    end
end

# 規定打数より多いときの結果を表示
def result_over(regulation, result)
    case result - regulation
    when 1
        "ボギー"
    when (2..)
        "#{result-regulation}ボギー"
    end
end

# ファイルの内容を一度配列にまとめる
regulation_and_result = []
2.times do
    s = gets.chomp.split(",")
    regulation_and_result << s
end

# まとめた配列を規定打数と結果に分ける
regulations = regulation_and_result[0].map(&:to_i)
results = regulation_and_result[1].map(&:to_i)

# 出力結果を一度配列に入れて表示を整形する
array = []
regulations.each_with_index do |regulation, index|
    if regulation - results[index] >= 0
        array << result_under(regulation, results[index])
    else
        array << result_over(regulation, results[index])
    end
end

puts array.join(",")