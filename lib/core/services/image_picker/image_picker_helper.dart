// core/helpers/image_picker_helper.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../di/get_it_service.dart';
import 'cubit/cubit/image_picker_cubit.dart';
import 'image_picker_service.dart';

// image_picker_helper.dart
class ImagePickerHelper {
  static Future<File?> showImagePicker({required BuildContext context}) async {
    return await showModalBottomSheet<File?>(
      context: context,
      builder:
          (_) => BlocProvider(
            create: (_) => ImagePickerCubit(getIt<ImagePickerService>()),
            child: const _ImagePickerBottomSheet(),
          ),
    );
  }
}

class _ImagePickerBottomSheet extends StatelessWidget {
  const _ImagePickerBottomSheet();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagePickerCubit, ImagePickerState>(
      listener: (context, state) {
        if (state is ImagePickerSuccess) {
          Navigator.pop(context, state.imageFile);
        } else if (state is ImagePickerFailure) {
          Navigator.pop(context, null);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Pick Image",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const _ImagePickerContent(),
          ],
        ),
      ),
    );
  }
}

class _ImagePickerContent extends StatelessWidget {
  const _ImagePickerContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      builder: (context, state) {
        if (state is ImagePickerLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take Photo'),
              onTap:
                  () => context.read<ImagePickerCubit>().pickImage(
                    ImageSource.camera,
                  ),
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Choose from Gallery'),
              onTap:
                  () => context.read<ImagePickerCubit>().pickImage(
                    ImageSource.gallery,
                  ),
            ),
          ],
        );
      },
    );
  }
}
