import 'user.dart';

class Item {
  final int id;
  final String description;
  final String location;
  final ItemStatus status;
  final DateTime registrationDate;
  final List<String> photos;
  final User owner;
  final DateTime? returnDate;

  Item({
    required this.id,
    required this.description,
    required this.location,
    required this.status,
    required this.registrationDate,
    required this.photos,
    required this.owner,
    this.returnDate,
  });
}

enum ItemStatus {
  lost,
  found,
}
