import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  final String titleCategory;
  final List<Widget> children;
  const CustomExpansionTileWidget(
      {Key? key, required this.titleCategory,required this.children})
      : super(key: key);
  @override
  _CustomExpansionTileWidgetState createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: ExpansionTile(
        backgroundColor: Colors.blueGrey,
        title: Text(
          widget.titleCategory,
        ),
        children: widget.children,
      ),
    );
  }
}
