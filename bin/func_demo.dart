int add(int a, int b) => a + b;

void enroll({required String name, int age = 18, String? className}) {
  print('姓名：$name，年龄：$age，班级：${className ?? '未分班'}');
}

void runFunctionDemo() {
  print('=== 函数与参数 ===');

  int result = add(3, 5);
  print('3 + 5 = $result');

  enroll(name: '李华', className: '2班');

  enroll(name: '王明', age: 19);
}
