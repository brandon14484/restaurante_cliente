import 'package:flutter/material.dart';
import 'package:restaurante_cliente/screens/kitchen-page/table_order_screen.dart';

class TableOrderScreen extends StatelessWidget {
  static const routeName = '/kitchen-page';

  const TableOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Historial de Ordenes")),
      //body: Table(
        //children: [
          //new List

          //)
       // ],
      //),
    );

  }
}

//class EatItem{
  //final String name;
  //final int token;

  //EatItem(this.name, this.token);
//}

//final List<EatItem> eatList = [
  //EatItem("Chorrillana",  1),
  //EatItem("pan", 2)
//];

//Widget buildTable({bool SortAscending = true}){
  //return DataTable(
    //sortColumnIndex: 0,
      //sortAscending: sortAscending,
      //onSelectAll: (bool value){},
      //columns: <DataColumn>[
        //const DataColumn(
          //label: Text('name'),
          //tooltip: 'name',
        //),
        //DataColumn(
          //label: const Text('token'),
          //tooltip: 'token',
          //numeric: true,
          //onSort: (int columIndex, bool ascending){},
        //),
      //],

      //rows: eatList<DataRow>((EatItem eatItem)){
      //return DataRow(
      //key: (earItem.name),
      //onSelectChanged:(bool selected){},
      //cells: <DataCell>[
    //DataCell(
  //Text(eatItem.name),
  //),
    //DataCell(
  //Text('${eatItem.toke}'),
  //showEditIcon: true,
  //onTap: (){},
  //),
  //],
      //);
  //}).toList()
  //);
//}

