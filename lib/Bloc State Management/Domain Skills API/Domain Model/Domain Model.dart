class DomainModel {
  final String domainName;

  DomainModel({required this.domainName});

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(domainName: json['domain_name']);
  }
}