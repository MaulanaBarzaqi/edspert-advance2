import 'package:advance/src/domain/usecase/upload_image_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UploadImageUsecase uploadImageUsecase;
  ProfileBloc(this.uploadImageUsecase) : super(ProfileFileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is UploadImageEvent) {
        emit(UploadImageLoading());
        final uploadImageDownloadResult = await uploadImageUsecase(event.file);
        if (uploadImageDownloadResult != null) {
          emit(UploadImageSucces(uploadImageDownloadResult));
          return;
        }
        emit(UploadImageError());
      }
    });
  }
}
