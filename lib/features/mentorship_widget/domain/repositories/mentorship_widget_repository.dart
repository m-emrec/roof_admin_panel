import 'package:core/core.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/member_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentat_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_info_entity.dart';

/// MentorshipWidgetRepository is an abstract class that defines the contract for
/// fetching mentor and mentat information from a data source.
/// It provides methods to get a single mentor, a single mentat, a list of mentors,
/// and a list of members based on their IDs.
abstract class MentorshipWidgetRepository {
  /// If the user is a member, fetches the mentor information for that member.
  /// Returns a [DataState] containing the [MemberInfoEntity] or an error.
  Future<DataState<MemberInfoEntity?>> getForMember(String mentorId);

  /// If the user is a mentor, fetches the mentat and members information for that mentor.
  /// Returns a [DataState] containing the [MentorInfoEntity] or an error.
  /// Takes the [mentatId] and a list of [memberIds] as parameters.
  Future<DataState<MentorInfoEntity?>> getForMentor(
    String mentatId,
    List<String> memberIds,
  );

  /// If the user is a mentat, fetches the list of mentors for that mentat.
  Future<DataState<MentatInfoEntity?>> getForMentat(
    List<String> mentorIds,
  );
}
