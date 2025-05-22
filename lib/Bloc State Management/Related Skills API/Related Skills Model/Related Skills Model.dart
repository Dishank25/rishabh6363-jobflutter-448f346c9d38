class RelatedSkillModel{
  final String skillName;

  RelatedSkillModel({required this.skillName});

  factory RelatedSkillModel.fromJson(Map<String, dynamic> json) {
    return RelatedSkillModel(skillName: json['skill_name']);
  }
}