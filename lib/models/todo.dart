class ToDo{
  final int userId;
  final int todoId;
  final String title;
  bool status;

  ToDo({required this.userId,required this.todoId,required this.title,required this.status});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      userId: json['userId'],
      todoId: json['id'],
      title: json['title'],
      status: json['completed']
    );
  }
}