# 規定打数以下のときの結果を表示
SCORE_MAPPING = {
        -1 => "ボギー",
        0 => "パー",
        1 => "バーディ",
        2 => "イーグル",
        3 => "アルバトロス",
        4 => "コンドル",
}
def show_result(regulation, result)
    # 前半がresult > regulation、後半がresult <= regulation
    if (2..).cover?(result-regulation)
        "#{result-regulation}ボギー"
    elsif (3..4).cover?(regulation) && result == 1
        "ホールインワン"
    else
        SCORE_MAPPING[regulation-result]
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
    array << show_result(regulation, results[index])
end

puts array.join(",")