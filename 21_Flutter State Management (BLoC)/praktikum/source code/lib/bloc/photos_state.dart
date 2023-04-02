// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  get images => listImage;
}

class PhotosInitial extends PhotosState {
  @override
  List<Object?> get props => [];
}

class PhotosSuccessLoaded extends PhotosState {
  @override
  final List<ImageModel> images;

  const PhotosSuccessLoaded({required this.images});

  @override
  List<Object?> get props => [images];
}