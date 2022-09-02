import 'package:flutter/material.dart';
import 'package:restaurante_cliente/models/backend/tables/table.dart';
import 'package:restaurante_cliente/models/repositories/repositories.dart';
import 'package:restaurante_cliente/screens/table/index/widgets/tables_index_list_widget.dart';
import 'package:restaurante_cliente/widgets/ui/ui.dart';

/// Muestra todas las mesas, y da la opción al admin para gestionarlas y registrar
/// nuevas.
class TableIndexScreen extends StatefulWidget {
  static const routeName = '/tables';
  const TableIndexScreen({super.key});

  @override
  TableIndexScreenState createState() => TableIndexScreenState();
}

class TableIndexScreenState extends State<TableIndexScreen> {
  bool _isLoading = false;
  List<TableModel> _tables = [];

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _fetchTables());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestionar mesas")),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 100, top: 50, bottom: 50),
              child: UiRaisedButton(text: "Registrar", onPressed: () => {
                debugPrint('hola'),
              },),
            ),
            _buildTablesSection(),
          ],
        ),
      ),
    );
  }

  _fetchTables() async {
    setState(() => _isLoading = true);

    try{
      List<TableModel> tables = await TablesRepository().fetchTables();
      setState(() => _tables = tables);
    } finally{
      setState(() => _isLoading = false);
    }
  }

  /// Muestra un listado de mesas registradas en la BD
  _buildTablesSection(){
    if (_isLoading){
      return Text("Cargando...");
    }

    return Expanded(
      child: TablesIndexListWidget(tables: _tables),
    );
  }
}
