class RaiseTicketResponseEntity {
  final bool success;
  final String? message;
  final RaiseTicketEntity ticket;

  const RaiseTicketResponseEntity({
    required this.success,
    required this.message,
    required this.ticket,
  });
}

class RaiseTicketEntity {
  final String status;
  final int id;
  final int userId;
  final String? name;
  final String? email;
  final String? role;
  final String? issueTitle;
  final String? issueDetail;
  final String? priority;
  final DateTime updatedAt;
  final DateTime createdAt;

  const RaiseTicketEntity({
    required this.status,
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.role,
    required this.issueTitle,
    required this.issueDetail,
    required this.priority,
    required this.updatedAt,
    required this.createdAt,
  });
}
