// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/widgets/add%20profile%20image/add_profile_image_mixin.dart';
import 'package:roof_admin_panel/product/widgets/custom%20bottom%20sheet/custom_bottom_sheet.dart';

class AddProfilePageBottomSheet extends StatefulWidget {
  final Function setImage;
  final bool willCropImage;
  const AddProfilePageBottomSheet(
    this.setImage, {
    this.willCropImage = true,
  });

  @override
  State<AddProfilePageBottomSheet> createState() =>
      _AddProfilePageBottomSheetState();
}

class _AddProfilePageBottomSheetState extends State<AddProfilePageBottomSheet>
    with AddProfileImageMixin {
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(
              LocaleKeys.createProfile_takeAPicture.tr(),
            ),
            onTap: () {
              CustomBottomSheet.hide(context);
              pickImageFromCamera();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: Text(
              LocaleKeys.createProfile_chooseFromGallery.tr(),
            ),
            onTap: () {
              CustomBottomSheet.hide(context);
              pickImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  @override
  bool? get willCropImage => widget.willCropImage;

  @override
  Future<void> setImage(File selectedImage) async {
    await widget.setImage(selectedImage);
  }
}
