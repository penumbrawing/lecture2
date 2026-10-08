String generateExperimentReport({
  required String title,
  required String author,
  int experimentNo = 1,
  String? className,
  String? conclusion,
}) {
  return '''
实验序号：$experimentNo
实验名称：$title
实验人：$author
班级：${className ?? '未填写'}
实验结论：${conclusion ?? '暂未填写'}
'''
      .trim();
}

void runReportGeneratorTask() {
  print('=== 自主任务2：实验报告生成器 ===');

  print('调用1：只提供必填参数');
  print(generateExperimentReport(title: 'Dart基础语法', author: '李华'));

  print('\n调用2：修改实验序号和班级');
  print(
    generateExperimentReport(
      title: '空安全实验',
      author: '李华',
      experimentNo: 2,
      className: '计科',
    ),
  );

  print('\n调用3：提供全部参数');
  print(
    generateExperimentReport(
      title: '控制流实验',
      author: '李华',
      experimentNo: 3,
      className: '计科',
      conclusion: '程序运行正常，边界测试通过',
    ),
  );
}
