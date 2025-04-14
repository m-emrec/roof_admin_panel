import 'package:core/core.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/member_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentat_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_info_entity.dart';

/// MentorshipWidgetRepository is an abstract class that defines the contract for
/// fetching mentor and mentat information from a data source.
/// It provides methods to get a single mentor, a single mentat, a list of mentors,
/// and a list of members based on their IDs.
abstract class MentorshipWidgetRepository {
  Future<DataState<MemberInfoEntity?>> getIfMember(String mentorId);

  Future<DataState<MentorInfoEntity?>> getIfMentor(
      String mentatId, List<String> memberIds);

  Future<DataState<MentatInfoEntity?>> getIfMentat(
    List<String> mentorIds,
  );
}
