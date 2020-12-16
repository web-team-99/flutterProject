import 'package:flutter/material.dart';
import '../../models/ProviderModels/manualModel.dart';
import 'CustomExpansionTile.dart';

class ManualWidget extends StatelessWidget {
  final ManualModel manualModel;

  ManualWidget({@required this.manualModel});

  @override
  Widget build(BuildContext context) {
    print(manualModel.entries[0].imageUrl);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // decoration: BoxDecoration(border: Border.all(width: 1)),
        padding: const EdgeInsets.all(2.0),
        child: CustomExpansionTile(
          backgroundColor: Theme.of(context).cardColor,
          childrenPadding: EdgeInsets.all(16),
          title: Text(
            manualModel.title,
          ),
          children: [
            ...manualModel.entries.map((e) => _ManualEntry(e)).toList()
          ],
        ),
      ),
    );
  }
}

class _ManualEntry extends StatelessWidget {
  final ManualEntry manualEntry;

  _ManualEntry(this.manualEntry);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, 0.0))
            ],
          ),
          child: SelectableText(
            manualEntry.title,
            style: theme.textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: SelectableText(
            manualEntry.description,
            style: theme.textTheme.bodyText1,
          ),
        ),
        if (manualEntry.imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(manualEntry.imageUrl),
          ),
        Divider(),
      ],
    );
  }
}
