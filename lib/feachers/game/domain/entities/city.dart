
import 'package:equatable/equatable.dart';

class City extends Equatable {
  const City({
    required this.name,
    required this.postcode,
  });
  final String name;
  final int postcode;

  @override
  List<Object?> get props => [name, postcode];
}
