import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/utility/extensions/show_click_mouse_cursor_on_widget_extension.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class MemberList extends StatelessWidget {
  const MemberList({
    super.key,
    required this.members,
  });
  final List<UserInfoModel?> members;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          // PopupMenuItem(enabled: false, child: SearchBar()),
          ...members.map(
            (e) {
              return PopupMenuItem(
                value: e,
                child: ListTile(
                  title: Text(
                    e?.name ?? " - ",
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.secondaryColor[30],
                    ),
                  ),
                  leading: Avatar(
                    imageUrl: e?.imageUrl,
                    radius: IconSizes.small.height,
                    showShadow: false,
                  ).showClickMouseCursorOnWidget(),
                ),
              );
            },
          ),
        ];
      },
      child: MemberListButton(
        members: members,
      ),
    );
  }
}

class MemberListButton extends StatelessWidget {
  const MemberListButton({
    super.key,
    required this.members,
  });

  final List<UserInfoModel?> members;

  int get _maxMembers => 5;

  int get length {
    if (members.length > _maxMembers) {
      return _maxMembers;
    }
    return members.length;
  }

  double get _height => 32;
  double get _width => 24;
  double get _divide => 2.5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width / _divide * length,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ...members.getRange(0, length).map((e) {
            return Positioned(
              left: members.indexOf(e) * _width / _divide,
              child: Avatar(
                imageUrl: e!.imageUrl,
                radius: _width / 2,
              ),
            );
          }),
          Positioned(
            left: members.length * _width / _divide,
            child: CircleAvatar(
              backgroundColor: AppColors.secondaryColor[90],
              radius: _width / 2,
              child: Text(
                "+${members.length}",
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.secondaryColor[10],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
