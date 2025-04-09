import 'package:core/core.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';

/// MentorshipWidgetRepository is an abstract class that defines the contract for
/// fetching mentor and mentat information from a data source.
/// It provides methods to get a single mentor, a single mentat, a list of mentors,
/// and a list of members based on their IDs.
abstract class MentorshipWidgetRepository {
  /// Gets the member's mentor information by the mentor ID.
  /// This is used to fetch the mentor of the member.
  /// Returns a [DataState] containing the [UserInfoEntity] of the mentor.
  /// If the mentor is not found, it returns null.
  Future<DataState<UserInfoEntity?>> getMentor(String mentorId);

  /// Gets the mentat information by the mentat ID.
  /// This is used to fetch the mentat of the mentor.
  /// Returns a [DataState] containing the [UserInfoEntity] of the mentat.
  /// If the mentat is not found, it returns null.
  Future<DataState<UserInfoEntity?>> getMentat(String mentatId);

  /// Gets a list of mentors based on the provided list of mentor IDs.
  /// This is used to fetch the mentors of the mentat.
  /// Returns a [DataState] containing a list of [UserInfoEntity] of mentors.
  /// If no mentors are found, it returns an empty list.
  Future<DataState<List<UserInfoEntity>>> getMentors(List<String> mentorIds);

  /// Gets a list of members based on the provided list of member IDs.
  /// This is used to fetch the members of the mentor.
  /// Returns a [DataState] containing a list of [UserInfoEntity] of members.
  /// If no members are found, it returns an empty list.
  Future<DataState<List<UserInfoEntity?>>> getMembers(List<String> memberIds);
}
