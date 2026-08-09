// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceState {

 SubjectStatus get status; bool get isLoading; List<SubjectStats> get subjectStats; List<AttendanceEntity>? get attendance; List<String>? get timetableSubjects; String? get error; List<SubjectBaseStatsEntity>? get baseStats;
/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceStateCopyWith<AttendanceState> get copyWith => _$AttendanceStateCopyWithImpl<AttendanceState>(this as AttendanceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceState&&(identical(other.status, status) || other.status == status)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.subjectStats, subjectStats)&&const DeepCollectionEquality().equals(other.attendance, attendance)&&const DeepCollectionEquality().equals(other.timetableSubjects, timetableSubjects)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.baseStats, baseStats));
}


@override
int get hashCode => Object.hash(runtimeType,status,isLoading,const DeepCollectionEquality().hash(subjectStats),const DeepCollectionEquality().hash(attendance),const DeepCollectionEquality().hash(timetableSubjects),error,const DeepCollectionEquality().hash(baseStats));

@override
String toString() {
  return 'AttendanceState(status: $status, isLoading: $isLoading, subjectStats: $subjectStats, attendance: $attendance, timetableSubjects: $timetableSubjects, error: $error, baseStats: $baseStats)';
}


}

/// @nodoc
abstract mixin class $AttendanceStateCopyWith<$Res>  {
  factory $AttendanceStateCopyWith(AttendanceState value, $Res Function(AttendanceState) _then) = _$AttendanceStateCopyWithImpl;
@useResult
$Res call({
 SubjectStatus status, bool isLoading, List<SubjectStats> subjectStats, List<AttendanceEntity>? attendance, List<String>? timetableSubjects, String? error, List<SubjectBaseStatsEntity>? baseStats
});




}
/// @nodoc
class _$AttendanceStateCopyWithImpl<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  _$AttendanceStateCopyWithImpl(this._self, this._then);

  final AttendanceState _self;
  final $Res Function(AttendanceState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isLoading = null,Object? subjectStats = null,Object? attendance = freezed,Object? timetableSubjects = freezed,Object? error = freezed,Object? baseStats = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubjectStatus,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,subjectStats: null == subjectStats ? _self.subjectStats : subjectStats // ignore: cast_nullable_to_non_nullable
as List<SubjectStats>,attendance: freezed == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<AttendanceEntity>?,timetableSubjects: freezed == timetableSubjects ? _self.timetableSubjects : timetableSubjects // ignore: cast_nullable_to_non_nullable
as List<String>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,baseStats: freezed == baseStats ? _self.baseStats : baseStats // ignore: cast_nullable_to_non_nullable
as List<SubjectBaseStatsEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceState].
extension AttendanceStatePatterns on AttendanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceState value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceState value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubjectStatus status,  bool isLoading,  List<SubjectStats> subjectStats,  List<AttendanceEntity>? attendance,  List<String>? timetableSubjects,  String? error,  List<SubjectBaseStatsEntity>? baseStats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
return $default(_that.status,_that.isLoading,_that.subjectStats,_that.attendance,_that.timetableSubjects,_that.error,_that.baseStats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubjectStatus status,  bool isLoading,  List<SubjectStats> subjectStats,  List<AttendanceEntity>? attendance,  List<String>? timetableSubjects,  String? error,  List<SubjectBaseStatsEntity>? baseStats)  $default,) {final _that = this;
switch (_that) {
case _AttendanceState():
return $default(_that.status,_that.isLoading,_that.subjectStats,_that.attendance,_that.timetableSubjects,_that.error,_that.baseStats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubjectStatus status,  bool isLoading,  List<SubjectStats> subjectStats,  List<AttendanceEntity>? attendance,  List<String>? timetableSubjects,  String? error,  List<SubjectBaseStatsEntity>? baseStats)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceState() when $default != null:
return $default(_that.status,_that.isLoading,_that.subjectStats,_that.attendance,_that.timetableSubjects,_that.error,_that.baseStats);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceState extends AttendanceState {
  const _AttendanceState({this.status = SubjectStatus.initial, this.isLoading = false, final  List<SubjectStats> subjectStats = const [], final  List<AttendanceEntity>? attendance, final  List<String>? timetableSubjects, this.error, final  List<SubjectBaseStatsEntity>? baseStats}): _subjectStats = subjectStats,_attendance = attendance,_timetableSubjects = timetableSubjects,_baseStats = baseStats,super._();
  

@override@JsonKey() final  SubjectStatus status;
@override@JsonKey() final  bool isLoading;
 final  List<SubjectStats> _subjectStats;
@override@JsonKey() List<SubjectStats> get subjectStats {
  if (_subjectStats is EqualUnmodifiableListView) return _subjectStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjectStats);
}

 final  List<AttendanceEntity>? _attendance;
@override List<AttendanceEntity>? get attendance {
  final value = _attendance;
  if (value == null) return null;
  if (_attendance is EqualUnmodifiableListView) return _attendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _timetableSubjects;
@override List<String>? get timetableSubjects {
  final value = _timetableSubjects;
  if (value == null) return null;
  if (_timetableSubjects is EqualUnmodifiableListView) return _timetableSubjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? error;
 final  List<SubjectBaseStatsEntity>? _baseStats;
@override List<SubjectBaseStatsEntity>? get baseStats {
  final value = _baseStats;
  if (value == null) return null;
  if (_baseStats is EqualUnmodifiableListView) return _baseStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceStateCopyWith<_AttendanceState> get copyWith => __$AttendanceStateCopyWithImpl<_AttendanceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceState&&(identical(other.status, status) || other.status == status)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._subjectStats, _subjectStats)&&const DeepCollectionEquality().equals(other._attendance, _attendance)&&const DeepCollectionEquality().equals(other._timetableSubjects, _timetableSubjects)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._baseStats, _baseStats));
}


@override
int get hashCode => Object.hash(runtimeType,status,isLoading,const DeepCollectionEquality().hash(_subjectStats),const DeepCollectionEquality().hash(_attendance),const DeepCollectionEquality().hash(_timetableSubjects),error,const DeepCollectionEquality().hash(_baseStats));

@override
String toString() {
  return 'AttendanceState(status: $status, isLoading: $isLoading, subjectStats: $subjectStats, attendance: $attendance, timetableSubjects: $timetableSubjects, error: $error, baseStats: $baseStats)';
}


}

/// @nodoc
abstract mixin class _$AttendanceStateCopyWith<$Res> implements $AttendanceStateCopyWith<$Res> {
  factory _$AttendanceStateCopyWith(_AttendanceState value, $Res Function(_AttendanceState) _then) = __$AttendanceStateCopyWithImpl;
@override @useResult
$Res call({
 SubjectStatus status, bool isLoading, List<SubjectStats> subjectStats, List<AttendanceEntity>? attendance, List<String>? timetableSubjects, String? error, List<SubjectBaseStatsEntity>? baseStats
});




}
/// @nodoc
class __$AttendanceStateCopyWithImpl<$Res>
    implements _$AttendanceStateCopyWith<$Res> {
  __$AttendanceStateCopyWithImpl(this._self, this._then);

  final _AttendanceState _self;
  final $Res Function(_AttendanceState) _then;

/// Create a copy of AttendanceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isLoading = null,Object? subjectStats = null,Object? attendance = freezed,Object? timetableSubjects = freezed,Object? error = freezed,Object? baseStats = freezed,}) {
  return _then(_AttendanceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubjectStatus,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,subjectStats: null == subjectStats ? _self._subjectStats : subjectStats // ignore: cast_nullable_to_non_nullable
as List<SubjectStats>,attendance: freezed == attendance ? _self._attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<AttendanceEntity>?,timetableSubjects: freezed == timetableSubjects ? _self._timetableSubjects : timetableSubjects // ignore: cast_nullable_to_non_nullable
as List<String>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,baseStats: freezed == baseStats ? _self._baseStats : baseStats // ignore: cast_nullable_to_non_nullable
as List<SubjectBaseStatsEntity>?,
  ));
}


}

// dart format on
