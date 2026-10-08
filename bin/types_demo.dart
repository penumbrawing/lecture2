int forcedLength(String? value) {
  return value!.length;
}

void printNicknameInfo(String? nickname) {
  // 1. 安全调用：null时返回null
  print('昵称长度：${nickname?.length}');

  // 2. 默认值：null时使用“未填写”
  print('昵称：${nickname ?? '未填写'}');
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

  // 演示null情况下的安全调用和默认值
  printNicknameInfo(null);

  // 演示非null情况
  String? nickname = 'hu';
  printNicknameInfo(nickname);

  // 3. 非空断言：forcedLength内部断言value不是null
  print('强制取得昵称长度：${forcedLength(nickname)}');

  // 4. 延迟初始化
  late String token;
  token = 'token-2026';
  print('Token：$token');
}
