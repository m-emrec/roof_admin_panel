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
  Future<DataState<MemberInfoEntity?>> getIfMember(String mentorId) {
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
  Future<DataState<MentatInfoEntity?>> getIfMentat(
      List<String> mentorIds) async {
    return DataState.handleDataState<MentatInfoEntity?>(() async {
      final mentatJson =
          await _mentorshipWidgetService.getMentorsForMentat(mentorIds);
      if (mentatJson != null && mentatJson.isNotEmpty) {
        return MentatInfo.fromJson(mentatJson);
      } else {
        return null;
      }
    });
  }

  @override
  Future<DataState<MentorInfoEntity?>> getIfMentor(
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

  // @override
  // Future<DataState<List<UserInfoEntity?>>> getMembersForMentor(
  //   List<String> memberIds,
  // ) {
  //   return DataState.handleDataState<List<UserInfoEntity?>>(
  //     () =>
  //         _mentorshipWidgetService.getMembersForMentor(memberIds).then((value) {
  //       if (value != null && value.isNotEmpty) {
  //         return value
  //             .map((e) => UserInfoModel.fromJson(e).toEntity())
  //             .toList();
  //       } else {
  //         return [];
  //       }
  //     }),
  //   );
  // }

  // @override
  // Future<DataState<UserInfoEntity?>> getIfMentor(String mentatId) {
  //   return DataState.handleDataState<UserInfoEntity?>(
  //     () => _mentorshipWidgetService.getMentatForMentor(mentatId).then((value) {
  //       if (value != null) {
  //         return UserInfoModel.fromJson(value).toEntity();
  //       } else {
  //         return null;
  //       }
  //     }),
  //   );
  // }

  // @override
  // Future<DataState<UserInfoEntity?>> getIfMember(String mentorId) async {
  //   return DataState.handleDataState<UserInfoEntity?>(
  //     () => _mentorshipWidgetService.getMentorForMember(mentorId).then((value) {
  //       if (value != null) {
  //         return UserInfoModel.fromJson(value).toEntity();
  //       } else {
  //         return null;
  //       }
  //     }),
  //   );
  // }

  // @override
  // Future<DataState<List<UserInfoEntity>>> getIfMentat(
  //   List<String> mentorIds,
  // ) {
  //   return DataState.handleDataState<List<UserInfoEntity>>(
  //     () =>
  //         _mentorshipWidgetService.getMentorsForMentat(mentorIds).then((value) {
  //       if (value != null && value.isNotEmpty) {
  //         return value
  //             .map((e) => UserInfoModel.fromJson(e).toEntity())
  //             .toList();
  //       } else {
  //         return [];
  //       }
  //     }),
  //   );
  // }
}
