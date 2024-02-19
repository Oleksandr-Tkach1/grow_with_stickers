class Page {
  String? titleRu;
  String? taskRu;
  String? task;
  String? payload;
  String? backgroundUrl;
  String? titleUa;
  String? taskUa;
  String? title;

  Page({
    required this.titleRu,
    required this.taskRu,
    required this.task,
    required this.payload,
    required this.backgroundUrl,
    required this.titleUa,
    required this.taskUa,
    required this.title,
  });

  Page.fromJson(Map<String, dynamic> json) {
    titleRu = json['title_ru'];
    taskRu = json['task_ru'];
    task = json['task'];
    payload = json['payload'];
    backgroundUrl = json['background_url'];
    titleUa = json['title_ua'];
    taskUa = json['task_ua'];
    title = json['title'];
  }
}