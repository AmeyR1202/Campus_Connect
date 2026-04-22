// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_base_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SubjectBaseStatsModel {
  String get subjectId => throw _privateConstructorUsedError;
  int get attended => throw _privateConstructorUsedError;
  int get missed => throw _privateConstructorUsedError;
  int get cancelled => throw _privateConstructorUsedError;

  /// Create a copy of SubjectBaseStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectBaseStatsModelCopyWith<SubjectBaseStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectBaseStatsModelCopyWith<$Res> {
  factory $SubjectBaseStatsModelCopyWith(
    SubjectBaseStatsModel value,
    $Res Function(SubjectBaseStatsModel) then,
  ) = _$SubjectBaseStatsModelCopyWithImpl<$Res, SubjectBaseStatsModel>;
  @useResult
  $Res call({String subjectId, int attended, int missed, int cancelled});
}

/// @nodoc
class _$SubjectBaseStatsModelCopyWithImpl<
  $Res,
  $Val extends SubjectBaseStatsModel
>
    implements $SubjectBaseStatsModelCopyWith<$Res> {
  _$SubjectBaseStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectBaseStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? attended = null,
    Object? missed = null,
    Object? cancelled = null,
  }) {
    return _then(
      _value.copyWith(
            subjectId: null == subjectId
                ? _value.subjectId
                : subjectId // ignore: cast_nullable_to_non_nullable
                      as String,
            attended: null == attended
                ? _value.attended
                : attended // ignore: cast_nullable_to_non_nullable
                      as int,
            missed: null == missed
                ? _value.missed
                : missed // ignore: cast_nullable_to_non_nullable
                      as int,
            cancelled: null == cancelled
                ? _value.cancelled
                : cancelled // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubjectBaseStatsModelImplCopyWith<$Res>
    implements $SubjectBaseStatsModelCopyWith<$Res> {
  factory _$$SubjectBaseStatsModelImplCopyWith(
    _$SubjectBaseStatsModelImpl value,
    $Res Function(_$SubjectBaseStatsModelImpl) then,
  ) = __$$SubjectBaseStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subjectId, int attended, int missed, int cancelled});
}

/// @nodoc
class __$$SubjectBaseStatsModelImplCopyWithImpl<$Res>
    extends
        _$SubjectBaseStatsModelCopyWithImpl<$Res, _$SubjectBaseStatsModelImpl>
    implements _$$SubjectBaseStatsModelImplCopyWith<$Res> {
  __$$SubjectBaseStatsModelImplCopyWithImpl(
    _$SubjectBaseStatsModelImpl _value,
    $Res Function(_$SubjectBaseStatsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubjectBaseStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? attended = null,
    Object? missed = null,
    Object? cancelled = null,
  }) {
    return _then(
      _$SubjectBaseStatsModelImpl(
        subjectId: null == subjectId
            ? _value.subjectId
            : subjectId // ignore: cast_nullable_to_non_nullable
                  as String,
        attended: null == attended
            ? _value.attended
            : attended // ignore: cast_nullable_to_non_nullable
                  as int,
        missed: null == missed
            ? _value.missed
            : missed // ignore: cast_nullable_to_non_nullable
                  as int,
        cancelled: null == cancelled
            ? _value.cancelled
            : cancelled // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$SubjectBaseStatsModelImpl extends _SubjectBaseStatsModel {
  const _$SubjectBaseStatsModelImpl({
    required this.subjectId,
    required this.attended,
    required this.missed,
    required this.cancelled,
  }) : super._();

  @override
  final String subjectId;
  @override
  final int attended;
  @override
  final int missed;
  @override
  final int cancelled;

  @override
  String toString() {
    return 'SubjectBaseStatsModel(subjectId: $subjectId, attended: $attended, missed: $missed, cancelled: $cancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectBaseStatsModelImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.attended, attended) ||
                other.attended == attended) &&
            (identical(other.missed, missed) || other.missed == missed) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, subjectId, attended, missed, cancelled);

  /// Create a copy of SubjectBaseStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectBaseStatsModelImplCopyWith<_$SubjectBaseStatsModelImpl>
  get copyWith =>
      __$$SubjectBaseStatsModelImplCopyWithImpl<_$SubjectBaseStatsModelImpl>(
        this,
        _$identity,
      );
}

abstract class _SubjectBaseStatsModel extends SubjectBaseStatsModel {
  const factory _SubjectBaseStatsModel({
    required final String subjectId,
    required final int attended,
    required final int missed,
    required final int cancelled,
  }) = _$SubjectBaseStatsModelImpl;
  const _SubjectBaseStatsModel._() : super._();

  @override
  String get subjectId;
  @override
  int get attended;
  @override
  int get missed;
  @override
  int get cancelled;

  /// Create a copy of SubjectBaseStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectBaseStatsModelImplCopyWith<_$SubjectBaseStatsModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
