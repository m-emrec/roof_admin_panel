import 'package:core/utils/constants/enums/roles.dart';

import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

class SelectionNotifier extends StateNotifier<UserModel?> {
  SelectionNotifier() : super(null);

  List<Role?> _roles = [];

  void initializeState(UserModel user) {
    state = user;
    _roles = user.role ?? [];
  }

  void select(String uids) {
    if (state == null) return;

    if (_roles.isMentat) {
      _selectMentorsToMentat(uids);
    } else if (_roles.isMentor) {
      _selectMembersToMentor(uids);
    } else {
      /// This is the case for a member or admin
      _selectMentorToMember(uids);
    }
  }

  void _selectMentorToMember(String uids) {
    if (state != null) {
      if (state!.mentorId == uids) {
        state = state!.copyWith(mentorId: "");
        return;
      } else {
        state = state!.copyWith(mentorId: uids);
      }
    }
  }

  void _selectMentatToMentor(String uids) {
    if (state != null) {
      state = state!.copyWith(mentatId: uids);
    }
  }

  void _selectMentorsToMentat(String uids) {
    if (state != null) {
      {
        if (state!.mentors == null) {
          state = state!.copyWith(mentors: [uids]);
        } else if (state!.mentors!.contains(uids)) {
          state = state!.copyWith(
            mentors:
                state!.mentors!.where((element) => element != uids).toList(),
          );
        } else {
          state = state!.copyWith(
            mentors: [...state!.mentors!, uids],
          );
        }
      }
    }
  }

  void _selectMembersToMentor(String uids) {
    if (state != null) {
      {
        if (state!.members == null) {
          state = state!.copyWith(members: [uids]);
        } else if (state!.members!.contains(uids)) {
          state = state!.copyWith(
            members:
                state!.members!.where((element) => element != uids).toList(),
          );
        } else {
          state = state!.copyWith(
            members: [...state!.members!, uids],
          );
        }
      }
    }
  }
}
