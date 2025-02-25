part of 'guest_table_actions_row.dart';

class _GuestsTableActionRowUtils {
  factory _GuestsTableActionRowUtils(
    BuildContext context,
    WidgetRef ref,
  ) =>
      _instance ??= _GuestsTableActionRowUtils._internal(
        context,
        ref,
      );
  _GuestsTableActionRowUtils._internal(
    this.context,
    this.ref,
  );

  static _GuestsTableActionRowUtils? _instance;

  final BuildContext context;
  final WidgetRef ref;

  List<Guest> get _selectedGuests => ref.read(selectedGuestsProvider);

  GuestsViewModel get _guestViewModel =>
      ref.read(guestsViewModelProvider.notifier);

  void _cleanSelectedGuests() {
    ref.read(selectedGuestsProvider.notifier).state = [];
  }

  void approveGuests() {
    _guestViewModel
        .approveGuests(
          _selectedGuests,
        )
        .showLoading(context: context)
        .then(
          (_) => _cleanSelectedGuests(),
        );
  }

  void deleteGuests() {
    _guestViewModel
        .deleteGuest(
          _selectedGuests,
        )
        .showLoading(context: context)
        .then(
          (_) => _cleanSelectedGuests(),
        );
  }
}
