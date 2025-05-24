import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../image_picker_service.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePickerService _imagePickerService;
  ImagePickerCubit(this._imagePickerService) : super(ImagePickerInitial());

  Future<void> pickImage(ImageSource source) async {
    emit(ImagePickerLoading());
    try {
      final File? image = await _imagePickerService.pickImage(source: source);
      if (image != null) {
        emit(ImagePickerSuccess(image));
      } else {
        emit(ImagePickerInitial()); // User cancelled
      }
    } catch (e) {
      emit(ImagePickerFailure(e.toString()));
    }
  }
}
