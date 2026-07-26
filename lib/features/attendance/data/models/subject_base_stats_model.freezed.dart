// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_base_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubjectBaseStatsModel {

 String get subjectId; int get attended; int get missed; int get cancelled;
/// Create a copy of SubjectBaseStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectBaseStatsModelCopyWith<SubjectBaseStatsModel> get copyWith => _$SubjectBaseStatsModelCopyWithImpl<SubjectBaseStatsModel>(this as SubjectBaseStatsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectBaseStatsModel&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.attended, attended) || other.attended == attended)&&(identical(other.missed, missed) || other.missed == missed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}


@override
int get hashCode => Object.hash(runtimeType,subjectId,attended,missed,cancelled);

@override
String toString() {
  return 'SubjectBaseStatsModel(subjectId: $subjectId, attended: $attended, missed: $missed, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class $SubjectBaseStatsModelCopyWith<$Res>  {
  factory $SubjectBaseStatsModelCopyWith(SubjectBaseStatsModel value, $Res Function(SubjectBaseStatsModel) _then) = _$SubjectBaseStatsModelCopyWithImpl;
@useResult
$Res call({
 String subjectId, int attended, int missed, int cancelled
});




}
/// @nodoc
class _$SubjectBaseStatsModelCopyWithImpl<$Res>
    implements $SubjectBaseStatsModelCopyWith<$Res> {
  _$SubjectBaseStatsModelCopyWithImpl(this._self, this._then);

  final SubjectBaseStatsModel _self;
  final $Res Function(SubjectBaseStatsModel) _then;

/// Create a copy of SubjectBaseStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectId = null,Object? attended = null,Object? missed = null,Object? cancelled = null,}) {
  return _then(_self.copyWith(
subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,attended: null == attended ? _self.attended : attended // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectBaseStatsModel].
extension SubjectBaseStatsModelPatterns on SubjectBaseStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectBaseStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectBaseStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectBaseStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _SubjectBaseStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectBaseStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectBaseStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String subjectId,  int attended,  int missed,  int cancelled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectBaseStatsModel() when $default != null:
return $default(_that.subjectId,_that.attended,_that.missed,_that.cancelled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String subjectId,  int attended,  int missed,  int cancelled)  $default,) {final _that = this;
switch (_that) {
case _SubjectBaseStatsModel():
return $default(_that.subjectId,_that.attended,_that.missed,_that.cancelled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String subjectId,  int attended,  int missed,  int cancelled)?  $default,) {final _that = this;
switch (_that) {
case _SubjectBaseStatsModel() when $default != null:
return $default(_that.subjectId,_that.attended,_that.missed,_that.cancelled);case _:
  return null;

}
}

}

/// @nodoc


class _SubjectBaseStatsModel extends SubjectBaseStatsModel {
  const _SubjectBaseStatsModel({required this.subjectId, required this.attended, required this.missed, required this.cancelled}): super._();
  

@override final  String subjectId;
@override final  int attended;
@override final  int missed;
@override final  int cancelled;

/// Create a copy of SubjectBaseStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectBaseStatsModelCopyWith<_SubjectBaseStatsModel> get copyWith => __$SubjectBaseStatsModelCopyWithImpl<_SubjectBaseStatsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectBaseStatsModel&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.attended, attended) || other.attended == attended)&&(identical(other.missed, missed) || other.missed == missed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}


@override
int get hashCode => Object.hash(runtimeType,subjectId,attended,missed,cancelled);

@override
String toString() {
  return 'SubjectBaseStatsModel(subjectId: $subjectId, attended: $attended, missed: $missed, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class _$SubjectBaseStatsModelCopyWith<$Res> implements $SubjectBaseStatsModelCopyWith<$Res> {
  factory _$SubjectBaseStatsModelCopyWith(_SubjectBaseStatsModel value, $Res Function(_SubjectBaseStatsModel) _then) = __$SubjectBaseStatsModelCopyWithImpl;
@override @useResult
$Res call({
 String subjectId, int attended, int missed, int cancelled
});




}
/// @nodoc
class __$SubjectBaseStatsModelCopyWithImpl<$Res>
    implements _$SubjectBaseStatsModelCopyWith<$Res> {
  __$SubjectBaseStatsModelCopyWithImpl(this._self, this._then);

  final _SubjectBaseStatsModel _self;
  final $Res Function(_SubjectBaseStatsModel) _then;

/// Create a copy of SubjectBaseStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectId = null,Object? attended = null,Object? missed = null,Object? cancelled = null,}) {
  return _then(_SubjectBaseStatsModel(
subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,attended: null == attended ? _self.attended : attended // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
