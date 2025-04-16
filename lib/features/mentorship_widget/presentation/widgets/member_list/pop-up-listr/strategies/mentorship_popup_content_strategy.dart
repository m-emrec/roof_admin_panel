part of '../mentorship_pop_up_list.dart';

abstract class MentorshipPopupContentStrategy {
  MentorshipPopupContentStrategy();

  factory MentorshipPopupContentStrategy.of(AbstractUserInfo user) {
    if (user is MentatInfo) return _MentatPopupContentStrategy(user);
    if (user is MentorInfo) return _MentorPopupContentStrategy(user);
    throw UnimplementedError('Unsupported user type');
  }
  String get toolTip;

  List<PopupMenuEntry<void>> itemBuilder(
    BuildContext context,
  );

  String get labelText;
  PopupMenuItem<void> label() {
    return PopupMenuItem<void>(
      enabled: false,
      child: Text(
        labelText,
      ),
    );
  }
}
