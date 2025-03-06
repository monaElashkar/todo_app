class TaskModel {
  String? id;
  bool? check;
  String? title;
  String? subTitle;

  TaskModel({this.id, this.check, this.title, this.subTitle});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    check = json['check'];
    title = json['title'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['check'] = check;
    data['title'] = title;
    data['sub_title'] =subTitle;
    return data;
  }
}