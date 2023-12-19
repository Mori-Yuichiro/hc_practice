members = ["A", "B", "C", "D", "E", "F"].shuffle
# 1グループの人数(3人か4人)を決める
num = rand(3..4)

groups= []
# 3人ずつ、もしくは4人と2人のグループに分ける
members.each_slice(num) {|member_array| groups << member_array.sort}
# 2人と4人の時、最初に2人のグループが表示されるようにする
p groups[1], groups[0]