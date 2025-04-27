part of "../membership_info_card.dart";

final class _OptionBadgeField extends BaseMembershipField<_Value?> {
  _OptionBadgeField(
    this.itemBuilder,
    this.ref,
    this.onSelected,
  ) : super(
          label: "",
          value: null,
          controller: null,
        );
  final List<PopupMenuEntry<_Value>> Function(BuildContext) itemBuilder;
  final WidgetRef ref;
  final void Function(_Value)? onSelected;
  @override
  Widget editStateWidget(BuildContext context) => Row(
        spacing: SpacingSizes.small,
        children: [
          InkWell(
            onTap: () =>
                ref.read(membershipDetailNotifierProvider.notifier).reset(),
            child: Icon(
              Icons.close,
              color: AppColors.accentError[50],
            ),
          ),
          InkWell(
            onTap: () => ref
                .read(membershipDetailNotifierProvider.notifier)
                .editMembershipDetails()
                .showLoading(context: context),
            child: Icon(
              Icons.check,
              color: AppColors.primaryColor[50],
            ),
          ),
        ],
      );

  @override
  Widget widget(BuildContext context) => PopupMenuButton(
        itemBuilder: itemBuilder,

        onSelected: onSelected, // Handle the selected value
      );
}
