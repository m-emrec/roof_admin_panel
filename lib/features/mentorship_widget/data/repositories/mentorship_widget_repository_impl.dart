import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

/// MentorshipWidgetRepositoryImpl is an implementation of the
class MentorshipWidgetRepositoryImpl implements MentorshipWidgetRepository {
  /// constructor for the MentorshipWidgetRepositoryImpl class.
  MentorshipWidgetRepositoryImpl(this._mentorshipWidgetService);

  final MentorshipWidgetService _mentorshipWidgetService;
  @override
  Future<DataState<List<UserInfoEntity?>>> getMembersForMentor(
      List<String> memberIds) {
    return DataState.handleDataState<List<UserInfoEntity?>>(
      () =>
          _mentorshipWidgetService.getMembersForMentor(memberIds).then((value) {
        if (value != null && value.isNotEmpty) {
          return value
              .map((e) => UserInfoModel.fromJson(e).toEntity())
              .toList();
        } else {
          return [];
        }
      }),
    );
  }

  @override
  Future<DataState<UserInfoEntity?>> getMentatForMentor(String mentatId) {
    return DataState.handleDataState<UserInfoEntity?>(
      () => _mentorshipWidgetService.getMentatForMentor(mentatId).then((value) {
        if (value != null) {
          return UserInfoModel.fromJson(value).toEntity();
        } else {
          return null;
        }
      }),
    );
  }

  @override
  Future<DataState<UserInfoEntity?>> getMentorForMember(String mentorId) async {
    return DataState.handleDataState<UserInfoEntity?>(
      () => _mentorshipWidgetService.getMentorForMember(mentorId).then((value) {
        if (value != null) {
          return UserInfoModel.fromJson(value).toEntity();
        } else {
          return null;
        }
      }),
    );
  }

  @override
  Future<DataState<List<UserInfoEntity>>> getMentorsForMentat(
    List<String> mentorIds,
  ) {
    return DataState.handleDataState<List<UserInfoEntity>>(
      () =>
          _mentorshipWidgetService.getMentorsForMentat(mentorIds).then((value) {
        if (value != null && value.isNotEmpty) {
          return value
              .map((e) => UserInfoModel.fromJson(e).toEntity())
              .toList();
        } else {
          return [];
        }
      }),
    );
  }
}
