part of 'membership_info_section.dart';

///
class _MembershipInfoCardItem extends ConsumerWidget {
  /// Used in the [MembershipInfoCard] to display the membership information
  /// in consistent layout.
  ///
  ///
  const _MembershipInfoCardItem({
    required this.label,
    required this.child,
  }) : _isEditable = true;
  const _MembershipInfoCardItem.notEditable({
    required this.label,
    required this.child,
  }) : _isEditable = false;

  /// The label of the membership information
  final String label;

  /// The value of the membership information
  final Widget child;
  final bool _isEditable;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: SpacingSizes.extraExtraSmall,
      runSpacing: SpacingSizes.extraExtraSmall,
      children: [
        Visibility(
          visible: !ref.watch(isEditingProvider),
          child: Text(
            "$label:",
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoLabelTextStyle,
          ),
        ),
        Visibility(
          visible: ref.watch(isEditingProvider) && _isEditable,
          child: child,
        ),
      ],
    );
  }
}

class _TextItem extends ConsumerWidget {
  const _TextItem({
    required this.editStateLabel,
    this.value,
    this.controller,
  });
  final String? value;
  final String editStateLabel;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return isEditing
        ? ClipRRect(
            borderRadius: const AppBorderRadius.small(),
            child: TextFormField(
              style: context.theme
                  .extension<MembershipInfoCardThemeExtension>()
                  ?.membershipInfoValueTextStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.backgroundColor,
                labelText: editStateLabel,
                constraints: BoxConstraints(
                  maxHeight: 20,
                  maxWidth: context.dynamicWidth(0.2),
                ),
                contentPadding:
                    const AppPadding.smallOnlyPadding(bottom: true, left: true),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelStyle: context.theme
                    .extension<MembershipInfoCardThemeExtension>()
                    ?.membershipInfoLabelTextStyle,
              ),
              controller: controller,
            ),
          )
        : Text(
            value ?? " - ",
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoValueTextStyle,
          );
  }
}

class _DateItem extends ConsumerWidget {
  const _DateItem(
    this.value,
    this.editStateLabel,
    this.controller,
  );
  final DateTime? value;
  final String editStateLabel;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);

    return isEditing
        ? Wrap(
            children: [
              Text(
                "$editStateLabel: ",
                style: context.theme
                    .extension<MembershipInfoCardThemeExtension>()
                    ?.membershipInfoLabelTextStyle,
              ),
              DateField(controller: controller ?? TextEditingController()),
            ],
          )
        : Text(
            value?.formatDate(context) ?? " - ",
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoValueTextStyle,
          );
  }
}
