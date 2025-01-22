import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/add_profile_picture_theme.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/app_colors.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';

/// A mixin that provides the functionality to add a profile image.
mixin AddProfileImageMixin<T extends StatefulWidget> on State<T> {
  /// The text for the add profile picture button.
  final addPRofilePictureText =
      tr(LocaleKeys.createProfile_addProfilePictureText);

  /// The theme for the add profile picture widget.
  late final AddProfilePictureTheme? theme;

  /// Image file
  File? image;
  final ImagePicker _picker = ImagePicker();

  @override
  void didChangeDependencies() {
    theme = context.theme.extension<AddProfilePictureTheme>();

    super.didChangeDependencies();
  }

  /// This method sets the image to the selected image
  Future<void> setImage(File selectedImage);

  /// Pick image from gallery
  Future<void> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    /// if image is not null then set the image
    if (image != null) {
      final croppedImage = await cropImage(File(image.path));
      // Use the selected image
      await setImage(File(croppedImage?.path ?? image.path));
    }
  }

  /// Builds a widget to display an image based on the current state.
  ///
  /// This method returns different widgets depending on the conditions:
  /// - If `image` is not null, it returns an `Image.file` with the selected image.
  /// - Otherwise, it returns an `Image.asset` with a placeholder image.
  ///
  /// Returns:
  /// - An `Image.file` if an image is selected.
  /// - An `Image.asset` as a placeholder if no image is selected.
  Widget buildImageWidget() {
    if (image != null) {
      return Image.file(image!, fit: BoxFit.cover);
    } else {
      return SvgPicture.asset(
        Assets.icons.addPictureIcon,
        fit: BoxFit.none,
      );
    }
  }

  /// Pick image from Camera
  Future<void> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);

    /// if image is not null then set the image
    if (image != null) {
      final croppedImage = await cropImage(File(image.path));
      // Use the selected image
      await setImage(File(croppedImage?.path ?? image.path));
    }
  }

  bool? get willCropImage;

  Future<CroppedFile?> cropImage(File image) async {
    if (willCropImage == false) {
      return null;
    } else {
      Future<CroppedFile?> croppedFile = ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            activeControlsWidgetColor: AppColors.primaryColor,
            hideBottomControls: true,
            toolbarTitle: LocaleKeys.createProfile_crop.tr(),
            toolbarColor: AppColors.backgroundColor[50],
            toolbarWidgetColor: AppColors.primaryColor,
            cropStyle: CropStyle.circle,
            lockAspectRatio: false,
            aspectRatioPresets: [
              // CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
          IOSUiSettings(
            cancelButtonTitle: LocaleKeys.common_cancel.tr(),
            doneButtonTitle: LocaleKeys.common_okay.tr(),
            cropStyle: CropStyle.circle,
            aspectRatioLockEnabled: true,
            title: LocaleKeys.createProfile_crop.tr(),
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
          ),
        ],
      );
      return croppedFile;
    }
  }
}
