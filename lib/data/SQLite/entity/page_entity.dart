const String tablePages = 'Pages';

class PageEntityField{
  static final List<String> values = [
    id,
    titleRu,
    taskRu,
    task,
    payload,
    backgroundUrl,
    titleUa,
    taskUa,
    title,
  ];

  static String id = 'id';
  static String titleRu = 'titleRu';
  static String taskRu = 'taskRu';
  static String task = 'task';
  static String payload = 'payload';
  static String backgroundUrl = 'backgroundUrl';
  static String titleUa = 'titleUa';
  static String taskUa = 'taskUa';
  static String title = 'title';
}

class PageEntity {
  int? id;
  String? titleRu;
  String? taskRu;
  String? task;
  String? payload;
  String? backgroundUrl;
  String? titleUa;
  String? taskUa;
  String? title;

  PageEntity({
    //required this.id,
    required this.titleRu,
    required this.taskRu,
    required this.task,
    required this.payload,
    required this.backgroundUrl,
    required this.titleUa,
    required this.taskUa,
    required this.title,
  });

  Map<String, dynamic> toMap(String bookProductId) {
    return {
      'id': id ?? null,
      'bookProductId': bookProductId,
      'titleRu': titleRu,
      'taskRu': taskRu,
      'task': task,
      'payload': payload,
      'backgroundUrl': backgroundUrl,
      'titleUa': titleUa,
      'taskUa': taskUa,
      'title': title,
    };
  }

  factory PageEntity.fromMap(Map<String, dynamic> map) {
    return PageEntity(
      //id: map['id'] ?? null,
      titleRu: map['titleRu'],
      taskRu: map['taskRu'],
      task: map['task'],
      payload: map['payload'],
      backgroundUrl: map['backgroundUrl'],
      titleUa: map['titleUa'],
      taskUa: map['taskUa'],
      title: map['title'],
    );
  }
}