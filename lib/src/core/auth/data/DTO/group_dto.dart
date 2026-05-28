class GroupDTO {
  final int id;
  final String name;

  const GroupDTO({required this.id, required this.name});

  factory GroupDTO.fromJson(Map<String, dynamic> json) => GroupDTO(
        id: json['id'] as int,
        name: json['name'] as String,
      );
}
