class TableModel {
  final int id;
  final int number;
  final String name;
  final bool isTaken;

  TableModel({
    required this.id,
    required this.number,
    required this.name,
    required this.isTaken,
  });

  TableModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        number = json['number'],
        name = json['name'],
        isTaken = json['is_taken'];

  static List<TableModel> fromJsonList(List<dynamic> jsonList) {
    List<TableModel> objects = [];
    for (var json in jsonList) {
      objects.add(TableModel.fromJson(json));
    }
    return objects;
  }
}
