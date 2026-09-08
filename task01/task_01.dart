class Task {
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  Task({required this.title, this.isCompleted = false, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

void main() {
  Task task01 = Task(
    title: 'إنشاء المشروع وتجهيز البنية الأساسية له',
    isCompleted: true,
  );
  Task task02 = Task(
    title: 'تجهيز الواجهات وتجربة المستخدم',
    createdAt: new DateTime.now().add(const Duration(days: -10)),
  );

  print(task01.toJson());
  print(task02.toJson());
}
