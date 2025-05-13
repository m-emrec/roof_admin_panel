import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/selection_dialog_for_mentor_state_mixin.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/selection_grid.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';

/// A dialog used specifically when the current user has the "Mentor" role.
///
/// This widget provides a tabbed interface for switching between two user types:
/// - "Members"
/// - "Mentats"
///
/// The currently selected tab determines which type of user data to fetch and display.
///
/// The user data is rendered in a [SelectionGrid], and fetched asynchronously using
/// [addMentorUsersNotifierProvider].
///
/// The [TabController] manages tab switching and notifies the state of tab changes,
/// updating the [shouldFetchMentatsProvider] accordingly to toggle between "Members" and "Mentats".
///
/// This widget is only shown inside [SelectUsersDialog] when the user's role is a mentor.
class SelectionDialogForMentor extends ConsumerStatefulWidget {
  /// Creates a [SelectionDialogForMentor] widget.
  ///
  const SelectionDialogForMentor({
    required this.user,
    super.key,
  });

  final MemberModel user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MentorState();
}

class _MentorState extends ConsumerState<SelectionDialogForMentor>
    with SingleTickerProviderStateMixin, SelectionDialogForMentorStateMixin {
  @override
  void initState() {
    initController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: [
            Tab(text: Role.member.localizedText("")),
            Tab(text: Role.mentat.localizedText("")),
          ],
        ),
        AsyncDataBuilder(
          provider: addMentorUsersNotifierProvider(widget.user.role ?? []),
          data: (data) => SizedBox(
            width: context.dynamicWidth(0.9),
            height: context.dynamicHeight(0.7),
            child: SelectionGrid(
              user: widget.user,
              data: data,
            ),
          ),
        ),
      ],
    );
  }
}
