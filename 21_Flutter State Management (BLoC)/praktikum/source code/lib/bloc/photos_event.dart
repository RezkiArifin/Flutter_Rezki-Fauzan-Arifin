part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  const PhotosEvent();
}

class FetchImagePhotosEvent extends PhotosEvent {
  @override
  List<Object?> get props => [];
}
