// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceModel {

 String get lectureId; String get subjectId; String get status; DateTime get markedAt;
/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceModelCopyWith<AttendanceModel> get copyWith => _$AttendanceModelCopyWithImpl<AttendanceModel>(this as AttendanceModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceModel&&(identical(other.lectureId, lectureId) || other.lectureId == lectureId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt));
}


@override
int get hashCode => Object.hash(runtimeType,lectureId,subjectId,status,markedAt);

@override
String toString() {
  return 'AttendanceModel(lectureId: $lectureId, subjectId: $subjectId, status: $status, markedAt: $markedAt)';
}


}

/// @nodoc
abstract mixin class $AttendanceModelCopyWith<$Res>  {
  factory $AttendanceModelCopyWith(AttendanceModel value, $Res Function(AttendanceModel) _then) = _$AttendanceModelCopyWithImpl;
@useResult
$Res call({
 String lectureId, String subjectId, String status, DateTime markedAt
});




}
/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._self, this._then);

  final AttendanceModel _self;
  final $Res Function(AttendanceModel) _then;

/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lectureId = null,Object? subjectId = null,Object? status = null,Object? markedAt = null,}) {
  return _then(_self.copyWith(
lectureId: null == lectureId ? _self.lectureId : lectureId // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,markedAt: null == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceModel].
extension AttendanceModelPatterns on AttendanceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceModel value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lectureId,  String subjectId,  String status,  DateTime markedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceModel() when $default != null:
return $default(_that.lectureId,_that.subjectId,_that.status,_that.markedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lectureId,  String subjectId,  String status,  DateTime markedAt)  $default,) {final _that = this;
switch (_that) {
case _AttendanceModel():
return $default(_that.lectureId,_that.subjectId,_that.status,_that.markedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lectureId,  String subjectId,  String status,  DateTime markedAt)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceModel() when $default != null:
return $default(_that.lectureId,_that.subjectId,_that.status,_that.markedAt);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceModel extends AttendanceModel {
  const _AttendanceModel({required this.lectureId, required this.subjectId, required this.status, required this.markedAt}): super._();
  

@override final  String lectureId;
@override final  String subjectId;
@override final  String status;
@override final  DateTime markedAt;

/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceModelCopyWith<_AttendanceModel> get copyWith => __$AttendanceModelCopyWithImpl<_AttendanceModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceModel&&(identical(other.lectureId, lectureId) || other.lectureId == lectureId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.markedAt, markedAt) || other.markedAt == markedAt));
}


@override
int get hashCode => Object.hash(runtimeType,lectureId,subjectId,status,markedAt);

@override
String toString() {
  return 'AttendanceModel(lectureId: $lectureId, subjectId: $subjectId, status: $status, markedAt: $markedAt)';
}


}

/// @nodoc
abstract mixin class _$AttendanceModelCopyWith<$Res> implements $AttendanceModelCopyWith<$Res> {
  factory _$AttendanceModelCopyWith(_AttendanceModel value, $Res Function(_AttendanceModel) _then) = __$AttendanceModelCopyWithImpl;
@override @useResult
$Res call({
 String lectureId, String subjectId, String status, DateTime markedAt
});




}
/// @nodoc
class __$AttendanceModelCopyWithImpl<$Res>
    implements _$AttendanceModelCopyWith<$Res> {
  __$AttendanceModelCopyWithImpl(this._self, this._then);

  final _AttendanceModel _self;
  final $Res Function(_AttendanceModel) _then;

/// Create a copy of AttendanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lectureId = null,Object? subjectId = null,Object? status = null,Object? markedAt = null,}) {
  return _then(_AttendanceModel(
lectureId: null == lectureId ? _self.lectureId : lectureId // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,markedAt: null == markedAt ? _self.markedAt : markedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
