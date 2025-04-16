part of '../mentorship_pop_up_list.dart';

/// An abstract strategy for building popup menu content based on the type of mentorship user.
///
/// This class defines the structure for generating a popup menu that dynamically adapts
/// based on whether the user is a `MentorInfo` or a `MentatInfo`. It encapsulates the
/// logic for building the list items (`itemBuilder`), defining the static label text
/// (`labelText`), and the tooltip shown on hover (`toolTip`).
///
/// Use the [MentorshipPopupContentStrategy.of] factory constructor to create the
/// appropriate concrete strategy for a given user type.
///
///It is mainly used in the [MentorshipPopupList] widget to provide a consistent
///
/// Example usage:
/// ```dart
/// final strategy = MentorshipPopupContentStrategy.of(user);
/// final items = strategy.itemBuilder(context);
/// ```
abstract class MentorshipPopupContentStrategy {
  /// Creates an instance of [MentorshipPopupContentStrategy].
  MentorshipPopupContentStrategy();

  /// Factory constructor that returns the appropriate strategy
  /// based on the type of user provided.
  ///
  /// It takes an [AbstractUserInfo] object and returns a concrete
  /// implementation of [MentorshipPopupContentStrategy].
  /// If the user is of type `MentatInfo`, it returns [_MentatPopupContentStrategy].
  /// If the user is of type `MentorInfo`, it returns [_MentorPopupContentStrategy].
  ///
  /// NOTE: If you add a new user type to [MentorshipPopupList], you need to
  /// implement a new strategy class and add it to this factory method.
  /// If the user type is unsupported, it throws an [UnimplementedError].
  ///
  factory MentorshipPopupContentStrategy.of(AbstractUserInfo user) {
    if (user is MentatInfo) return _MentatPopupContentStrategy(user);
    if (user is MentorInfo) return _MentorPopupContentStrategy(user);
    throw UnimplementedError('Unsupported user type');
  }

  /// Tooltip text shown when hovering over the popup menu.
  /// This text provides additional information about the action
  /// that will be performed when the menu is opened.
  String get toolTip;

  /// Generates a list of popup menu entries.
  List<PopupMenuEntry<void>> itemBuilder(
    BuildContext context,
  );

  /// Generates a label for the popup menu.
  String get labelText;

  /// Creates a label item for the popup menu.
  /// This item is not selectable and serves as a static label.
  /// It is used to provide context for the items in the popup menu.
  PopupMenuItem<void> label() {
    return PopupMenuItem<void>(
      enabled: false,
      child: Text(
        labelText,
      ),
    );
  }
}
