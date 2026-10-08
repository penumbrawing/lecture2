int forcedLength(String? value) {
  return value!.length;
}

void runTypesDemo() {
  print('=== 变量与空安全 ===');

  var title = '第2次作业';
  int year = 2026;
  double score = 92.5;

  print('标题：$title');
  print('年份：$year');
  print('成绩：$score');

  final now = DateTime.now();
  const pi = 3.14159;

  print('当前时间：$now');
  print('圆周率：$pi');

  String? nickname;

  // 1. 安全调用：null时返回null
  print('空昵称长度：${nickname?.length}');

  // 2. 默认值：null时使用“未填写”
  print('昵称：${nickname ?? '未填写'}');

  nickname = 'hu';

  // 3. 非空断言：程序员保证value不是null
  print('昵称长度：${forcedLength(nickname)}');

  // 4. 延迟初始化
  late String token;
  token = 'token-2026';
  print('Token：$token');
}
