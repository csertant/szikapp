import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  final String id;
  String name;
  String? description;
  String? email;
  List<String>? memberIDs;
  DateTime? lastUpdate;

  Group({
    required this.id,
    required this.name,
    this.description,
    this.email,
    this.memberIDs,
    this.lastUpdate,
  }) {
    memberIDs ??= <String>[];
  }

  void addMember(String userID) {
    if (!memberIDs!.contains(userID)) {
      memberIDs!.add(userID);
    }
  }

  void removeMember(String userID) {
    if (memberIDs!.contains(userID)) {
      memberIDs!.remove(userID);
    }
  }

  void removeAllMembers() {
    if (memberIDs!.isNotEmpty) {
      memberIDs!.clear();
    }
  }

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
