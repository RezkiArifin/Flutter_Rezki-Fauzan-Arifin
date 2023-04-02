import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:praktikum/main.dart';
import 'package:praktikum/models/image_model.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosEvent>((event, emit) {
      if (event is FetchImagePhotosEvent) {
        emit(PhotosSuccessLoaded(images: listImage));
      }
    });
  }
}
