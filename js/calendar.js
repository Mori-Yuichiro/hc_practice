const { program } = require('commander')

program.option('-m, --month, <type>', 'select month')
program.parse(process.argv)

// 土曜日には出力後に改行を入れる
const dayJudge = (day) => {
    if (day.getDay() === 6) {
        console.log((' ' + day.getDate()).slice(-2))
    } else if (day.getDay() >= 0 && day.getDay() <= 5) {
        process.stdout.write((' ' + day.getDate()).slice(-2) + ' ');
    }
}

// 第一週の表示位置を調節する
const firstWeekBlank = (wday) => {
    wdayBlank = wday === 0 ? 7 : wday;
    // process.stdout.write('   '.repeat(wdayBlank - 1));
    process.stdout.write('   '.repeat(wdayBlank));
}

const options = program.opts();
if (Number(options.month) > 12 || Number(options.month) < 1) {
    console.log(`${options.month} is neither a month number (1..12) nor a name`);
    return;
}

const now = new Date();
const selectedMonth = options.month ? Number(options.month) : now.getMonth() + 1;

const firstDay = new Date(2024, selectedMonth - 1, 1);
const firstDayWday = firstDay.getDay();
const lastDay = new Date(2024, selectedMonth, 0);

console.log(`     ${selectedMonth}月 ${now.getFullYear()}`);
console.log('日 月 火 水 木 金 土');
firstWeekBlank(firstDayWday);
for (let day = firstDay; day <= lastDay; day.setDate(day.getDate() + 1)) {
    dayJudge(day);
}
console.log('');