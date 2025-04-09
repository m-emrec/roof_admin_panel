import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';

class MentorshipWidgetRepositoryImpl implements MentorshipWidgetRepository {
  MentorshipWidgetRepositoryImpl(this._mentorshipWidgetService);

  final MentorshipWidgetService _mentorshipWidgetService;
  @override
  Future<DataState<List<UserInfoEntity?>>> getMembers(List<String> memberIds) {
    return DataState.handleDataState<List<UserInfoEntity?>>(
      () => _mentorshipWidgetService.getMembers(memberIds).then((value) {
        if (value.isNotEmpty) {
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
  Future<DataState<UserInfoEntity?>> getMentat(String mentatId) {
    return DataState.handleDataState<UserInfoEntity?>(
      () => _mentorshipWidgetService.getMentat(mentatId).then((value) {
        if (value != null) {
          return UserInfoModel.fromJson(value).toEntity();
        } else {
          return null;
        }
      }),
    );
  }

  @override
  Future<DataState<UserInfoEntity?>> getMentor(String mentorId) async {
    return DataState.handleDataState<UserInfoEntity?>(
      () => _mentorshipWidgetService.getMentor(mentorId).then((value) {
        if (value != null) {
          return UserInfoModel.fromJson(value).toEntity();
        } else {
          return null;
        }
      }),
    );
  }

  @override
  Future<DataState<List<UserInfoEntity>>> getMentors(List<String> mentorIds) {
    return DataState.handleDataState<List<UserInfoEntity>>(
      () => _mentorshipWidgetService.getMentors(mentorIds).then((value) {
        if (value.isNotEmpty) {
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
