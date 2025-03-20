import 'package:core/extensions/context_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/user_card_theme_extension.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/user%20card/account_setting_avatar.dart';

mixin AccountSettingAvatarStateMixin on ConsumerState<AccountSettingAvatar> {
  bool isHovered = false;
  late final double avatarRadius;
  final animationDuration = const Duration(milliseconds: 300);
  @override
  void didChangeDependencies() {
    avatarRadius =
        context.theme.extension<UserCardThemeExtension>()?.avatarRadius ?? 0;
    super.didChangeDependencies();
  }

  void onHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  Future<XFile?> _selectImage() async {
    return ImagePicker().pickImage(source: ImageSource.gallery);
  }

  void onTap() async {
    final pickedImage = await _selectImage();
    if (pickedImage != null) {
      await ref
          .read(accountSettingsNotifierProvider.notifier)
          .updateProfilePicture(
            pickedImage.path,
          );
    }
  }
}
