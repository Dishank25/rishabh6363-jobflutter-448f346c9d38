// location_entity.dart
class LocationEntity {
  final int id;
  final String name;

  const LocationEntity({
    required this.id,
    required this.name,
  });
}

class LocationListEntity {
  final bool success;
  final List<LocationEntity> locations;
  final String message;

  const LocationListEntity({
    required this.success,
    required this.locations,
    required this.message,
  });
}

// college_entity.dart
class CollegeEntity {
  final int id;
  final String name;
  final String logoPic;

  const CollegeEntity({
    required this.id,
    required this.name,
    required this.logoPic,
  });
}

class CollegeListEntity {
  final bool success;
  final List<CollegeEntity> colleges;
  final String message;

  const CollegeListEntity({
    required this.success,
    required this.colleges,
    required this.message,
  });
}

// course_entity.dart
class CourseEntity {
  final int id;
  final String name;

  const CourseEntity({
    required this.id,
    required this.name,
  });
}

class CourseListEntity {
  final bool success;
  final List<CourseEntity> courses;
  final String message;

  const CourseListEntity({
    required this.success,
    required this.courses,
    required this.message,
  });
}

// domain_entity.dart
class DomainEntity {
  final int id;
  final String name;

  const DomainEntity({
    required this.id,
    required this.name,
  });
}

class DomainListEntity {
  final List<DomainEntity> domains;

  const DomainListEntity({
    required this.domains,
  });
}

// skill_entity.dart
class SkillEntity {
  final int id;
  final String name;

  const SkillEntity({
    required this.id,
    required this.name,
  });
}

class SkillListEntity {
  final List<SkillEntity> skills;

  const SkillListEntity({
    required this.skills,
  });
}

class SpecializationEntity {
  final int id;
  final String name;
  final int courseId;
  final SCourseEntity course;

  const SpecializationEntity({
    required this.id,
    required this.name,
    required this.courseId,
    required this.course,
  });
}

class SCourseEntity {
  final String name;

  const SCourseEntity({
    required this.name,
  });
}
