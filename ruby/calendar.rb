require 'date'
require 'optparse'

opt = OptionParser.new
option = {}

# 第一週の表示位置を調節する
def first_week_blank(wday)
  wday_blank = wday.zero? ? 7 : wday
  print '   ' * (wday_blank - 1)
end

# 日曜日には出力後に改行を入れる
def day_judge(day)
  if day.wday == 0
    puts sprintf("%2d", day.day)
  elsif day.wday >= 1 && day.wday <= 6
    print sprintf("%2d", day.day) + ' '
  end
end

arg = opt.on('-m month', Integer) {
  |month| option[:month] = month
}
opt.parse!(ARGV)

now = Date.today
year = now.year
select_month = option[:month] || now.month

# 月の範囲外を入力したら、エラーを出す
if select_month < 1 || select_month > 12
  puts "#{option[:month]} is neither a month number (1..12) nor a name"
  exit
end

first_day = Date.new(year, select_month)
first_day_wday = first_day.wday
last_day = Date.new(year, select_month, -1)

puts "#{select_month}月 2023".center(20)
puts "月 火 水 木 金 土 日"
# 第一週の表示位置を合わせる
first_week_blank(first_day_wday)
# 日付を表示
(first_day..last_day).each do |day|
  day_judge(day)
end 
puts ""