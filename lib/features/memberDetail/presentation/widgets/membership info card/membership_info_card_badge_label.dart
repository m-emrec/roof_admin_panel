part of 'membership_info_card.dart';

class _MembershipInfoCardBadgeLabel extends ConsumerWidget {
  const _MembershipInfoCardBadgeLabel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(isEditingProvider.notifier).state = true;
    // });
    return ref.watch(isEditingProvider)
        ? Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.edit,
                  color: AppColors.primaryColor[50],
                ),
              ),
              const SizedBox(width: SpacingSizes.extraSmall),
              Text(
                'Edit',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor[50],
                ),
              ),
            ],
          )
        : PopupMenuButton(
            itemBuilder: _popMenuItemBuilder,
            onSelected: (value) => ref.read(isEditingProvider.notifier).state =
                value == 1 ? true : false,
          );
  }

  List<PopupMenuEntry<int>> _popMenuItemBuilder(BuildContext context) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            'Edit',
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            'Delete',
          ),
        ),
      ];
}
