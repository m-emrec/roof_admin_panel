import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/member_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentat_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentor_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/member_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentat_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

/// MentorshipWidgetRepositoryImpl is an implementation of the
class MentorshipWidgetRepositoryImpl implements MentorshipWidgetRepository {
  /// constructor for the MentorshipWidgetRepositoryImpl class.
  MentorshipWidgetRepositoryImpl(this._mentorshipWidgetService);

  final MentorshipWidgetService _mentorshipWidgetService;

  @override
  Future<DataState<MemberInfoEntity?>> getForMember(String mentorId) {
    return DataState.handleDataState(
      () =>
          _mentorshipWidgetService.fetchMentorForMember(mentorId).then((value) {
        if (value != null) {
          return MemberInfo.fromJson(value);
        } else {
          return null;
        }
      }),
    );
  }

  @override
  Future<DataState<MentatInfoEntity?>> getForMentat(
    List<String> mentorIds,
  ) async {
    return DataState.handleDataState<MentatInfoEntity?>(() async {
      final mentatJson =
          await _mentorshipWidgetService.fetchMentorsForMentat(mentorIds);
      if (mentatJson != null && mentatJson.isNotEmpty) {
        return MentatInfo.fromJson(mentatJson);
      } else {
        return null;
      }
    });
  }

  @override
  Future<DataState<MentorInfoEntity?>> getForMentor(
    String mentatId,
    List<String> memberIds,
  ) {
    return DataState.handleDataState<MentorInfoEntity?>(() async {
      return MentorInfo.fromJson(
        membersJson:
            await _mentorshipWidgetService.fetchMembersForMentor(memberIds),
        mentatJson:
            await _mentorshipWidgetService.fetchMentatForMentor(mentatId),
      );
    });
  }
}
