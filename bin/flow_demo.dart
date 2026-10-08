String gradeOf(int score) {
  if (score < 0 || score > 100) {
    return '成绩无效';
  }

  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  return '不及格';
}

void runFlowDemo() {
  print('=== 分支与循环 ===');

  for (final score in [95, 85, 70, 50]) {
    print('$score分：${gradeOf(score)}');
  }

  for (final i in [1, 2, 3]) {
    print('第$i题');
  }

  print('7 / 2 = ${7 / 2}');
  print('7 ~/ 2 = ${7 ~/ 2}');
}
