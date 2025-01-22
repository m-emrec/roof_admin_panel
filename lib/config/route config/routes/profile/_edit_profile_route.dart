import 'package:go_router/go_router.dart';
import 'package:roof_network/config/route%20config/routes/base_route_class.dart';
import 'package:roof_network/features/edit%20profile/presentation/pages/edit_profile_screen.dart';
import 'package:roof_network/product/models/user_model.dart';
import 'package:roof_network/product/utility/logger/logger.dart';

///
final class EditProfileRoute extends BaseRouteClass {
  /// A route that navigates to the [EditProfileScreen].
  /// This route is used to navigate to the [EditProfileScreen] and pass the user data to it.
  /// If the user data is not passed, the screen will be displayed with empty fields.
  /// If the user data is passed, the screen will be displayed with the user data.
  ///
  /// It is child of the [ProfileRoute].
  factory EditProfileRoute() => _instance;
  EditProfileRoute._internal();

  static final EditProfileRoute _instance = EditProfileRoute._internal();

  /// A route that navigates to the [EditProfileScreen].
  @override
  GoRoute get route => GoRoute(
        path: "/edit-profile",
        name: "editProfile",
        builder: (context, state) {
          UserModel user;

          try {
            if (state.extra != null && state.extra.runtimeType == UserModel) {
              // ignore: cast_nullable_to_non_nullable
              user = state.extra as UserModel;
            } else {
              user = UserModel();
            }
            return EditProfileScreen(
              user: user,
            );
          } catch (e) {
            Log.error("Error parsing user data: $e");
            return EditProfileScreen(
              user: UserModel(),
            );
          }
        },
      );
}
