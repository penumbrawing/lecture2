String describeNickname(String? nickname) {
  final displayName = nickname ?? '未填写';
  final length = nickname?.length ?? 0;
  final uppercaseName = nickname?.toUpperCase() ?? '未填写';

  return '昵称：$displayName；长度：$length；大写：$uppercaseName';
}

void runNullSafetyTask() {
  print('=== 自主任务1：空安全改写 ===');

  print(describeNickname(null));
  print(describeNickname('hu'));
}
