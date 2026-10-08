String gradeOfExtended(int score) {
  if (score < 0 || score > 100) {
    return '成绩超出有效范围';
  }

  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  return '不及格';
}

String gradeFromInput(String input) {
  final score = int.tryParse(input.trim());

  if (score == null) {
    return '非法输入：请输入整数';
  }

  return gradeOfExtended(score);
}

void runGradeClassifierTask() {
  print('=== 自主任务3：成绩分级器 ===');

  final inputs = ['100', '90', '80', '60', '0', '101', '-1', 'abc'];

  for (final input in inputs) {
    print('输入 $input：${gradeFromInput(input)}');
  }
}
