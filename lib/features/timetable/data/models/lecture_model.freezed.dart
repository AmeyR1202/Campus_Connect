// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LectureModel implements DiagnosticableTreeMixin {

 String get lectureId; String get subjectName; String get day; DateTime get startTime; DateTime get endTime; String get type;
/// Create a copy of LectureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LectureModelCopyWith<LectureModel> get copyWith => _$LectureModelCopyWithImpl<LectureModel>(this as LectureModel, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LectureModel'))
    ..add(DiagnosticsProperty('lectureId', lectureId))..add(DiagnosticsProperty('subjectName', subjectName))..add(DiagnosticsProperty('day', day))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('type', type));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LectureModel&&(identical(other.lectureId, lectureId) || other.lectureId == lectureId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.day, day) || other.day == day)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,lectureId,subjectName,day,startTime,endTime,type);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LectureModel(lectureId: $lectureId, subjectName: $subjectName, day: $day, startTime: $startTime, endTime: $endTime, type: $type)';
}


}

/// @nodoc
abstract mixin class $LectureModelCopyWith<$Res>  {
  factory $LectureModelCopyWith(LectureModel value, $Res Function(LectureModel) _then) = _$LectureModelCopyWithImpl;
@useResult
$Res call({
 String lectureId, String subjectName, String day, DateTime startTime, DateTime endTime, String type
});




}
/// @nodoc
class _$LectureModelCopyWithImpl<$Res>
    implements $LectureModelCopyWith<$Res> {
  _$LectureModelCopyWithImpl(this._self, this._then);

  final LectureModel _self;
  final $Res Function(LectureModel) _then;

/// Create a copy of LectureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lectureId = null,Object? subjectName = null,Object? day = null,Object? startTime = null,Object? endTime = null,Object? type = null,}) {
  return _then(_self.copyWith(
lectureId: null == lectureId ? _self.lectureId : lectureId // ignore: cast_nullable_to_non_nullable
as String,subjectName: null == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LectureModel].
extension LectureModelPatterns on LectureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LectureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LectureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LectureModel value)  $default,){
final _that = this;
switch (_that) {
case _LectureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LectureModel value)?  $default,){
final _that = this;
switch (_that) {
case _LectureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lectureId,  String subjectName,  String day,  DateTime startTime,  DateTime endTime,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LectureModel() when $default != null:
return $default(_that.lectureId,_that.subjectName,_that.day,_that.startTime,_that.endTime,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lectureId,  String subjectName,  String day,  DateTime startTime,  DateTime endTime,  String type)  $default,) {final _that = this;
switch (_that) {
case _LectureModel():
return $default(_that.lectureId,_that.subjectName,_that.day,_that.startTime,_that.endTime,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lectureId,  String subjectName,  String day,  DateTime startTime,  DateTime endTime,  String type)?  $default,) {final _that = this;
switch (_that) {
case _LectureModel() when $default != null:
return $default(_that.lectureId,_that.subjectName,_that.day,_that.startTime,_that.endTime,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _LectureModel extends LectureModel with DiagnosticableTreeMixin {
  const _LectureModel({required this.lectureId, required this.subjectName, required this.day, required this.startTime, required this.endTime, required this.type}): super._();
  

@override final  String lectureId;
@override final  String subjectName;
@override final  String day;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override final  String type;

/// Create a copy of LectureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LectureModelCopyWith<_LectureModel> get copyWith => __$LectureModelCopyWithImpl<_LectureModel>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LectureModel'))
    ..add(DiagnosticsProperty('lectureId', lectureId))..add(DiagnosticsProperty('subjectName', subjectName))..add(DiagnosticsProperty('day', day))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('type', type));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LectureModel&&(identical(other.lectureId, lectureId) || other.lectureId == lectureId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.day, day) || other.day == day)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,lectureId,subjectName,day,startTime,endTime,type);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LectureModel(lectureId: $lectureId, subjectName: $subjectName, day: $day, startTime: $startTime, endTime: $endTime, type: $type)';
}


}

/// @nodoc
abstract mixin class _$LectureModelCopyWith<$Res> implements $LectureModelCopyWith<$Res> {
  factory _$LectureModelCopyWith(_LectureModel value, $Res Function(_LectureModel) _then) = __$LectureModelCopyWithImpl;
@override @useResult
$Res call({
 String lectureId, String subjectName, String day, DateTime startTime, DateTime endTime, String type
});




}
/// @nodoc
class __$LectureModelCopyWithImpl<$Res>
    implements _$LectureModelCopyWith<$Res> {
  __$LectureModelCopyWithImpl(this._self, this._then);

  final _LectureModel _self;
  final $Res Function(_LectureModel) _then;

/// Create a copy of LectureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lectureId = null,Object? subjectName = null,Object? day = null,Object? startTime = null,Object? endTime = null,Object? type = null,}) {
  return _then(_LectureModel(
lectureId: null == lectureId ? _self.lectureId : lectureId // ignore: cast_nullable_to_non_nullable
as String,subjectName: null == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
