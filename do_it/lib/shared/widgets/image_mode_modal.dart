import 'package:do_it/core/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImageSelectionModal extends StatelessWidget {
  final Function(ImageSource imageSource) onPickImage;
  
  const ImageSelectionModal({ 
    Key? key, 
    required this.onPickImage 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 18
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                MdiIcons.image,
              ),
              title: customTextMedium(
                'Pick from Gallery',
                fontWeight: FontWeight.w600,
                alignment: TextAlign.start
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 14,
              ),
              onTap: () {
                Navigator.of(context).pop();
                onPickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                MdiIcons.camera,
              ),
              title: customTextMedium(
                'Capture from Camera',
                fontWeight: FontWeight.w600,
                alignment: TextAlign.start
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 14,
              ),
              onTap: () {
                Navigator.of(context).pop();
                onPickImage(ImageSource.camera);
              },
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}