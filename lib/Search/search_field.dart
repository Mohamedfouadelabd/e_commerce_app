import 'package:e_commerce_app/Theme/my_theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType keyboardType;

  SearchField({
    required this.controller,
    required this.validator,
    required this.keyboardType,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final FocusNode _focusNode = FocusNode();
  bool _showCursor = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _showCursor = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        showCursor: _showCursor,
        autofocus: false,
        style: TextStyle(
          color: MyTheme.primary,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'What do you search for?',
          hintStyle: Theme.of(context).textTheme.titleSmall,
          prefixIcon: Icon(
            Icons.search,
            color: MyTheme.primary,
            size: 28,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyTheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyTheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
