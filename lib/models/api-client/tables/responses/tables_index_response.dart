import 'package:restaurante_cliente/models/backend/tables/table.dart';

import '../../api_model.dart';

class TablesIndexResponse implements ApiModel {
  final List<TableModel> tables;

  TablesIndexResponse({required this.tables});

  TablesIndexResponse.fromJson(Map<String, dynamic> json)
      : tables = TableModel.fromJsonList(json['tables']);
}
