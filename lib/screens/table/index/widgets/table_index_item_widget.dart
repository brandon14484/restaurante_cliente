import 'package:flutter/material.dart';
import 'package:restaurante_cliente/models/backend/tables/table.dart';
import 'package:restaurante_cliente/widgets/ui/container/rounded-elevated/rounted_elevated_container_widget.dart';

class TableIndexItemWidget extends StatelessWidget {
  final Function onTap;
  final TableModel table;

  const TableIndexItemWidget({
    super.key,
    required this.table,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 11, 8),
      child: InkWell(
        onTap: () => onTap(),
        child: RoundedElevatedContainerWidget(
          width: double.infinity,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          table.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
