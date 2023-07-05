import 'package:flutter/material.dart';

class DropdownButtonWrapper extends StatefulWidget {
  final List<String> list;
  final String? initalValue;
  final TextStyle? textStyle;
  final double underLineHeight;
  final Color underLineColor;
  final void Function(String) callBack;
  final EdgeInsets margin;

  const DropdownButtonWrapper({
    super.key,
    required this.list,
    required this.callBack,
    this.initalValue,
    this.textStyle,
    this.underLineColor = Colors.teal,
    this.underLineHeight = 2,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
  });

  @override
  State<DropdownButtonWrapper> createState() => _DropdownButtonWrapperState();
}

class _DropdownButtonWrapperState extends State<DropdownButtonWrapper> {
  late List<String> dropdownValue;
  @override
  void initState() {
    super.initState();
    dropdownValue = [widget.list.first];
  }

  String value = "";

  @override
  Widget build(BuildContext context) {
    value = dropdownValue.first;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: widget.initalValue ?? dropdownValue.first,
        icon: Icon(
          Icons.abc,
          color: Colors.transparent,
        ),
        elevation: 16,
        style: Theme.of(context).textTheme.bodyLarge,
        underline: Container(
          height: 2,
          color: Colors.purple,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue.first = value!;
          });
          widget.callBack(value!);
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: widget.textStyle ?? Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }).toList(),
      ),
    );
  }
}
