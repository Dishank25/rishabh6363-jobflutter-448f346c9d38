import 'package:job_portal/views/user_profile/domain/entities/raise_ticket_entity.dart';

class RaiseTicketResponseModel extends RaiseTicketResponseEntity {
  const RaiseTicketResponseModel({
    required super.success,
    required super.message,
    required super.ticket,
  });

  factory RaiseTicketResponseModel.fromJson(Map<String, dynamic> json) {
    return RaiseTicketResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      ticket: RaiseTicketModel.fromJson({'ticket': json['ticket']}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'ticket': (ticket as RaiseTicketModel).toJson(),
    };
  }
}

class RaiseTicketModel extends RaiseTicketEntity {
  const RaiseTicketModel({
    required super.status,
    required super.id,
    required super.userId,
    required super.name,
    required super.email,
    required super.role,
    required super.issueTitle,
    required super.issueDetail,
    required super.priority,
    required super.updatedAt,
    required super.createdAt,
  });

  factory RaiseTicketModel.fromJson(Map<String, dynamic> json) {
    final ticket = json['ticket'];

    return RaiseTicketModel(
      status: ticket['status'] ?? '',
      id: ticket['id'] ?? 0,
      userId: int.tryParse(ticket['userId'].toString()) ?? 0,
      name: ticket['name'] ?? '',
      email: ticket['email'] ?? '',
      role: ticket['role'] ?? '',
      issueTitle: ticket['issueTitle'] ?? '',
      issueDetail: ticket['issueDetail'] ?? '',
      priority: ticket['priority'] ?? '',
      updatedAt: DateTime.parse(ticket['updatedAt']),
      createdAt: DateTime.parse(ticket['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
      'issueTitle': issueTitle,
      'issueDetail': issueDetail,
      'priority': priority,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
