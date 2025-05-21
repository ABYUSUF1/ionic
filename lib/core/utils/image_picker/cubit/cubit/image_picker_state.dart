part of 'image_picker_cubit.dart';

sealed class ImagePickerState {
  const ImagePickerState();
}

final class ImagePickerInitial extends ImagePickerState {}

final class ImagePickerLoading extends ImagePickerState {}

final class ImagePickerSuccess extends ImagePickerState {
  final File imageFile;

  const ImagePickerSuccess(this.imageFile);
}

final class ImagePickerFailure extends ImagePickerState {
  final String errMessage;

  const ImagePickerFailure(this.errMessage);
}
