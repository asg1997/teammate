import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  Size get _size => MediaQuery.of(this).size;
  double get width => _size.width;
  double get height => _size.height;
}
