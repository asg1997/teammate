import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension FormBuilderStateExtentions on GlobalKey<FormBuilderState> {
  T? valueByName<T>(String fieldName) =>
      currentState?.fields[fieldName]?.value as T?;

  void didChange(String fieldName, String text) =>
      currentState?.fields[fieldName]?.didChange(text);
}
