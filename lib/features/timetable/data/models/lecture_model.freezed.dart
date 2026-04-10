// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LectureModel {
  String get lectureId => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get subjectId => throw _privateConstructorUsedError;

  /// Create a copy of LectureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LectureModelCopyWith<LectureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureModelCopyWith<$Res> {
  factory $LectureModelCopyWith(
    LectureModel value,
    $Res Function(LectureModel) then,
  ) = _$LectureModelCopyWithImpl<$Res, LectureModel>;
  @useResult
  $Res call({
    String lectureId,
    String subjectName,
    String day,
    String startTime,
    String endTime,
    String type,
    String subjectId,
  });
}

/// @nodoc
class _$LectureModelCopyWithImpl<$Res, $Val extends LectureModel>
    implements $LectureModelCopyWith<$Res> {
  _$LectureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LectureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lectureId = null,
    Object? subjectName = null,
    Object? day = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? subjectId = null,
  }) {
    return _then(
      _value.copyWith(
            lectureId: null == lectureId
                ? _value.lectureId
                : lectureId // ignore: cast_nullable_to_non_nullable
                      as String,
            subjectName: null == subjectName
                ? _value.subjectName
                : subjectName // ignore: cast_nullable_to_non_nullable
                      as String,
            day: null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            subjectId: null == subjectId
                ? _value.subjectId
                : subjectId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LectureModelImplCopyWith<$Res>
    implements $LectureModelCopyWith<$Res> {
  factory _$$LectureModelImplCopyWith(
    _$LectureModelImpl value,
    $Res Function(_$LectureModelImpl) then,
  ) = __$$LectureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String lectureId,
    String subjectName,
    String day,
    String startTime,
    String endTime,
    String type,
    String subjectId,
  });
}

/// @nodoc
class __$$LectureModelImplCopyWithImpl<$Res>
    extends _$LectureModelCopyWithImpl<$Res, _$LectureModelImpl>
    implements _$$LectureModelImplCopyWith<$Res> {
  __$$LectureModelImplCopyWithImpl(
    _$LectureModelImpl _value,
    $Res Function(_$LectureModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LectureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lectureId = null,
    Object? subjectName = null,
    Object? day = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? subjectId = null,
  }) {
    return _then(
      _$LectureModelImpl(
        lectureId: null == lectureId
            ? _value.lectureId
            : lectureId // ignore: cast_nullable_to_non_nullable
                  as String,
        subjectName: null == subjectName
            ? _value.subjectName
            : subjectName // ignore: cast_nullable_to_non_nullable
                  as String,
        day: null == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        subjectId: null == subjectId
            ? _value.subjectId
            : subjectId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LectureModelImpl extends _LectureModel with DiagnosticableTreeMixin {
  const _$LectureModelImpl({
    required this.lectureId,
    required this.subjectName,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.subjectId,
  }) : super._();

  @override
  final String lectureId;
  @override
  final String subjectName;
  @override
  final String day;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String type;
  @override
  final String subjectId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LectureModel(lectureId: $lectureId, subjectName: $subjectName, day: $day, startTime: $startTime, endTime: $endTime, type: $type, subjectId: $subjectId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LectureModel'))
      ..add(DiagnosticsProperty('lectureId', lectureId))
      ..add(DiagnosticsProperty('subjectName', subjectName))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('subjectId', subjectId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LectureModelImpl &&
            (identical(other.lectureId, lectureId) ||
                other.lectureId == lectureId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    lectureId,
    subjectName,
    day,
    startTime,
    endTime,
    type,
    subjectId,
  );

  /// Create a copy of LectureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LectureModelImplCopyWith<_$LectureModelImpl> get copyWith =>
      __$$LectureModelImplCopyWithImpl<_$LectureModelImpl>(this, _$identity);
}

abstract class _LectureModel extends LectureModel {
  const factory _LectureModel({
    required final String lectureId,
    required final String subjectName,
    required final String day,
    required final String startTime,
    required final String endTime,
    required final String type,
    required final String subjectId,
  }) = _$LectureModelImpl;
  const _LectureModel._() : super._();

  @override
  String get lectureId;
  @override
  String get subjectName;
  @override
  String get day;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get type;
  @override
  String get subjectId;

  /// Create a copy of LectureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LectureModelImplCopyWith<_$LectureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
