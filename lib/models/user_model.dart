class User {
  final String id;
  final String userEmail;
  final String? profileImage;
  final List<int>? followers;
  final List<int>? following;

  User({
    required this.id,
    required this.userEmail,
    this.profileImage,
    this.followers,
    this.following,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      userEmail: json['userEmail'],
      profileImage: json['profileImage'] ?? "",
      followers: (json['followers'] as List?)?.map((e) => int.parse(e.toString())).toList() ?? [],
      following: (json['following'] as List?)?.map((e) => int.parse(e.toString())).toList() ?? [],
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userEmail': userEmail,
      'profileImage': profileImage,
      'followers': followers ?? [],
      'following': following ?? [],
    };
  }
}
