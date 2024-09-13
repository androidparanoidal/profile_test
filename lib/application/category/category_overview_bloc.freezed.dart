// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_overview_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryOverviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryOverviewEventCopyWith<$Res> {
  factory $CategoryOverviewEventCopyWith(CategoryOverviewEvent value,
          $Res Function(CategoryOverviewEvent) then) =
      _$CategoryOverviewEventCopyWithImpl<$Res, CategoryOverviewEvent>;
}

/// @nodoc
class _$CategoryOverviewEventCopyWithImpl<$Res,
        $Val extends CategoryOverviewEvent>
    implements $CategoryOverviewEventCopyWith<$Res> {
  _$CategoryOverviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CategoryOverviewEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CategoryOverviewEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CategoryOverviewEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$CategoryOverviewState {
  LoadingStatus get status => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryOverviewStateCopyWith<CategoryOverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryOverviewStateCopyWith<$Res> {
  factory $CategoryOverviewStateCopyWith(CategoryOverviewState value,
          $Res Function(CategoryOverviewState) then) =
      _$CategoryOverviewStateCopyWithImpl<$Res, CategoryOverviewState>;
  @useResult
  $Res call({LoadingStatus status, List<Category> categories});

  $LoadingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CategoryOverviewStateCopyWithImpl<$Res,
        $Val extends CategoryOverviewState>
    implements $CategoryOverviewStateCopyWith<$Res> {
  _$CategoryOverviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoadingStatusCopyWith<$Res> get status {
    return $LoadingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryOverviewStateImplCopyWith<$Res>
    implements $CategoryOverviewStateCopyWith<$Res> {
  factory _$$CategoryOverviewStateImplCopyWith(
          _$CategoryOverviewStateImpl value,
          $Res Function(_$CategoryOverviewStateImpl) then) =
      __$$CategoryOverviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadingStatus status, List<Category> categories});

  @override
  $LoadingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$CategoryOverviewStateImplCopyWithImpl<$Res>
    extends _$CategoryOverviewStateCopyWithImpl<$Res,
        _$CategoryOverviewStateImpl>
    implements _$$CategoryOverviewStateImplCopyWith<$Res> {
  __$$CategoryOverviewStateImplCopyWithImpl(_$CategoryOverviewStateImpl _value,
      $Res Function(_$CategoryOverviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_$CategoryOverviewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$CategoryOverviewStateImpl extends _CategoryOverviewState {
  const _$CategoryOverviewStateImpl(
      {required this.status, required final List<Category> categories})
      : _categories = categories,
        super._();

  @override
  final LoadingStatus status;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryOverviewState(status: $status, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryOverviewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryOverviewStateImplCopyWith<_$CategoryOverviewStateImpl>
      get copyWith => __$$CategoryOverviewStateImplCopyWithImpl<
          _$CategoryOverviewStateImpl>(this, _$identity);
}

abstract class _CategoryOverviewState extends CategoryOverviewState {
  const factory _CategoryOverviewState(
      {required final LoadingStatus status,
      required final List<Category> categories}) = _$CategoryOverviewStateImpl;
  const _CategoryOverviewState._() : super._();

  @override
  LoadingStatus get status;
  @override
  List<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryOverviewStateImplCopyWith<_$CategoryOverviewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
