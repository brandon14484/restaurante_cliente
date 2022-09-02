import 'package:flutter/material.dart';
import 'package:restaurante_cliente/models/backend/tables/table.dart';
import 'package:restaurante_cliente/screens/table/index/widgets/table_index_item_widget.dart';

class TablesIndexListWidget extends StatefulWidget {
  final List<TableModel> tables;

  const TablesIndexListWidget({super.key, required this.tables});

  @override
  TablesIndexListWidgetState createState() => TablesIndexListWidgetState();
}

class TablesIndexListWidgetState extends State<TablesIndexListWidget> {
  final ScrollController _verticalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitle(context: context),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 5, top: 10),
            child: Scrollbar(
              controller: _verticalScrollController,
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                controller: _verticalScrollController,
                children: [
                  for (TableModel table in widget.tables)
                    TableIndexItemWidget(
                      table: table,
                      onTap: () => {},
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitle({required BuildContext context}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 12),
        child: Text(
          'Mesas',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
