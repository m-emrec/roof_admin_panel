import 'package:core/core.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';

abstract class MentorshipWidgetRepository {
  Future<DataState<UserInfoEntity?>> getMentor(String mentorId);

  Future<DataState<UserInfoEntity?>> getMentat(String mentatId);

  Future<DataState<List<UserInfoEntity>>> getMentors(List<String> mentorIds);

  Future<DataState<List<UserInfoEntity?>>> getMembers(List<String> memberIds);
}
