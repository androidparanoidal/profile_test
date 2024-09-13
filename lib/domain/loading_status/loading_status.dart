import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_status.freezed.dart';

@freezed
class LoadingStatus with _$LoadingStatus {
  const LoadingStatus._();
  const factory LoadingStatus.initial() = _Initial;
  const factory LoadingStatus.loading() = _Loading;
  const factory LoadingStatus.success([@Default('') String message]) = _Success;
  const factory LoadingStatus.failure(String message) = _Failure;
}
