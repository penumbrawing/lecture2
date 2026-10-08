# AI对拍练习 Round 1

## 题目

## 第 1 题（空安全 · ?.）

Dart

1
2
3
4
5
6
7
8

\`void main() {
String? a = 'hello';
String? b = null;

print(a?.length);
print(b?.length);
print(a?.length?.isEven);
}\`

预测：三行各输出什么？

## 第 2 题（空安全 · ?? 的链式与嵌套）

Dart

1
2
3
4
5
6
7
8
9
10

\`void main() {
String? x;
String? y = 'B';

print(x ?? y);
print(x ?? y ?? 'C');

x = 'A';
print(x ?? y);
}\`

预测：三行各输出什么？

## 第 3 题（空安全 · !）

Dart

1
2
3
4
5
6
7
8
9
10
11

\`void main() {
String? getName(bool flag) {
return flag ? 'Dart' : null;
}

print(getName(true)!.length);

String? s = getName(false);
print(s);
print(s!.toUpperCase());
}\`

预测：依次输出什么？程序在哪一行崩溃（如果会崩）？崩溃时报什么异常类型？

## 第 4 题（命名参数 · required 与默认值）

Dart

1
2
3
4
5
6
7
8
9

\`String enroll({required String name, int age = 18, String city = '上海'}) {
return '$name, $age岁, 来自\$city';
}

void main() {
print(enroll(name: '张三'));
print(enroll(name: '李四', city: '北京'));
print(enroll(age: 30, name: '王五'));
}\`

预测：三行各输出什么？（第 3 行注意参数书写顺序）

## 第 5 题（/ 与 \~/ 与插值）

Dart

1
2
3
4
5
6
7

`void main() { print(7 / 2); print(7 ~/ 2); print(-7 ~/ 2); print(8 / 2); print('${7 ~/ 2 * 2}'); }`

预测：五行各输出什么？特别注意第 3 行和第 4 行的输出格式。

***

# 我的答案

1.5 / null / false;

2.B / B / A;

3.4 / null / 崩溃.(崩溃行：print(s!.toUpperCase()),异常类型:Null check operator used on a null value;)&#x20;

4.张三, 18岁, 来自上海,李四, 18岁, 来自北京,王五, 30岁, 来自上海;&#x20;

5.3.5 / 3 / -3 / 4.0 / 6

***

# AI参考答案

核对完毕。 5 题全对 ——包括最容易翻车的`-7 ~/ 2` 和`8 / 2` 的输出格式。逐题给参考答案和解释，你看完重点不是"对了"，而是"你用的理由和语言规范是不是同一个"。

第 1 题：5 / null / false

1
2
3

`print(a?.length); // 5 —— a 非空，正常取长度 print(b?.length); // null —— b 为 null，?. 直接短路，整个表达式得 null，不报错 print(a?.length?.isEven); // false`

第三行是链式判空的考点：`a?.length` 得`5` ，此时`5` 是非空 int，`?.isEven` 继续走 →`5.isEven` →`false` 。

注意一个微妙点 ：如果`a` 是 null，`a?.length?.isEven` 整体得`null` 而不是报错——链上任何一环为 null，后面全部短路。这是`?.` 链和"逐个判空"等价的依据。

第 2 题：B / B / A

1
2
3

`print(x ?? y); // B —— x 为 null，取 y print(x ?? y ?? 'C'); // B —— ?? 左结合：(x ?? y) ?? 'C'，第一步已是 'B'，非 null，'C' 不执行 print(x ?? y); // A —— x 已被赋 'A'，y 根本没被读取`

考点：`??` 左结合 + 短路 ——左操作数非 null 时，右操作数表达式根本不求值。所以`x ?? expensiveFunction()` 里那个函数在 x 非空时不会执行。

第 3 题：4 / null / 崩溃于 print(s!.toUpperCase())，异常 Null check operator used on a null value

1
2
3

`print(getName(true)!.length); // 4 —— 'Dart'.length print(s); // null —— 直接打印可空变量没问题 print(s!.toUpperCase()); // 运行时抛 _CastError（Error 类，消息即你写的那句）`

你写的异常消息完全正确。补充两个精确化：

1. 这不是`Exception` 而是`Error` 类型——Dart 里`!` 用在 null 上抛出的是运行时 Error，语义是"程序员的断言失败"，官方定位是 不该被 catch 恢复 ，修代码而不是兜异常。
2. 对照记忆：这道题里`print(s)` 输出 null 没事、`s!` 才崩——说明可空变量本身可以存在、可以传递、可以打印， 只有当你向它索要"非空成员"时才需要担保 。这就是`??` （给备胎，安全）与`!` （下赌注，崩了算你）的方向性区别，也是口头检查点的标准答案。

第 4 题：张三, 18岁, 来自上海 / 李四, 18岁, 来自北京 / 王五, 30岁, 来自上海

全对。第三行的考点你踩准了： 命名参数与书写顺序无关 ，`enroll(age: 30, name: '王五')` 完全合法。这也是为什么调用处参数名是签名的一部分——`age` 和`name` 本身就是"标签"，位置不承担语义。

第 5 题：3.5 / 3 / -3 / 4.0 / 6

1
2
3
4
5

`print(7 / 2); // 3.5 —— / 永远返回 double，哪怕两边都是 int print(7 ~/ 2); // 3 print(-7 ~/ 2); // -3 —— ~/ 向零截断，不是向负无穷取整 print(8 / 2); // 4.0 —— 整除也返回 double，打印带 .0 print('${7 ~/ 2 * 2}'); // 6 —— ~/ 和 * 同优先级，左结合：(7~/2)*2`

两个值得记死的点：

1. `-7 ~/ 2 == -3` ：Dart 的`~/` 是 向零截断 （-3.5 → -3），和 Python 的`//` （向负无穷取整，-7//2 == -4） 不一样 。从别的语言转过来最容易在这里栽。你答对了，但确认一下你是推理出来的还是蒙的——如果是后者，把这条规则记进错题本。
2. `8 / 2` 输出`4.0` 不是`4` ：类型是 double，字符串化带小数点。雨课堂常拿"输出 4 还是 4.0"设坑。
3. 第 5 行顺带考了插值内表达式的优先级：`~/` 与`*` 同级左结合，所以是`3 * 2 = 6` 而不是`7 ~/ 4 = 1` 。

收尾动作

1. 这份对拍没有分歧题，但按流程建议 挑第 5 题实跑一次验证 （5 秒的事）——"全对"这个结论也要有编译器背书，顺便把输出截图留作对拍记录的证据。
2. 把对拍记录（题目 / 我的答案 / AI答案 / 结论）写入文件（如`lecture2/quiz_round1.md` 或按你进度报告的结构放），然后提交：
   Bash

<br />

###

