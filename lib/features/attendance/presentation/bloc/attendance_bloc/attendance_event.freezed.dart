// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceEvent {

 String get userId;
/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceEventCopyWith<AttendanceEvent> get copyWith => _$AttendanceEventCopyWithImpl<AttendanceEvent>(this as AttendanceEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'AttendanceEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AttendanceEventCopyWith<$Res>  {
  factory $AttendanceEventCopyWith(AttendanceEvent value, $Res Function(AttendanceEvent) _then) = _$AttendanceEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$AttendanceEventCopyWithImpl<$Res>
    implements $AttendanceEventCopyWith<$Res> {
  _$AttendanceEventCopyWithImpl(this._self, this._then);

  final AttendanceEvent _self;
  final $Res Function(AttendanceEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceEvent].
extension AttendanceEventPatterns on AttendanceEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchAttendanceEvent value)?  fetchAttendance,TResult Function( AddAttendanceEvent value)?  addAttendance,TResult Function( FetchAllSubjectsStatsEvent value)?  fetchAllSubjectsStatsEvent,TResult Function( UpdateLectureEvent value)?  updateLectureEvent,TResult Function( SetBaseStatsEvent value)?  setBaseStatsEvent,TResult Function( SyncAttendanceDataEvent value)?  syncAttendanceDataEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchAttendanceEvent() when fetchAttendance != null:
return fetchAttendance(_that);case AddAttendanceEvent() when addAttendance != null:
return addAttendance(_that);case FetchAllSubjectsStatsEvent() when fetchAllSubjectsStatsEvent != null:
return fetchAllSubjectsStatsEvent(_that);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that);case SetBaseStatsEvent() when setBaseStatsEvent != null:
return setBaseStatsEvent(_that);case SyncAttendanceDataEvent() when syncAttendanceDataEvent != null:
return syncAttendanceDataEvent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchAttendanceEvent value)  fetchAttendance,required TResult Function( AddAttendanceEvent value)  addAttendance,required TResult Function( FetchAllSubjectsStatsEvent value)  fetchAllSubjectsStatsEvent,required TResult Function( UpdateLectureEvent value)  updateLectureEvent,required TResult Function( SetBaseStatsEvent value)  setBaseStatsEvent,required TResult Function( SyncAttendanceDataEvent value)  syncAttendanceDataEvent,}){
final _that = this;
switch (_that) {
case FetchAttendanceEvent():
return fetchAttendance(_that);case AddAttendanceEvent():
return addAttendance(_that);case FetchAllSubjectsStatsEvent():
return fetchAllSubjectsStatsEvent(_that);case UpdateLectureEvent():
return updateLectureEvent(_that);case SetBaseStatsEvent():
return setBaseStatsEvent(_that);case SyncAttendanceDataEvent():
return syncAttendanceDataEvent(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchAttendanceEvent value)?  fetchAttendance,TResult? Function( AddAttendanceEvent value)?  addAttendance,TResult? Function( FetchAllSubjectsStatsEvent value)?  fetchAllSubjectsStatsEvent,TResult? Function( UpdateLectureEvent value)?  updateLectureEvent,TResult? Function( SetBaseStatsEvent value)?  setBaseStatsEvent,TResult? Function( SyncAttendanceDataEvent value)?  syncAttendanceDataEvent,}){
final _that = this;
switch (_that) {
case FetchAttendanceEvent() when fetchAttendance != null:
return fetchAttendance(_that);case AddAttendanceEvent() when addAttendance != null:
return addAttendance(_that);case FetchAllSubjectsStatsEvent() when fetchAllSubjectsStatsEvent != null:
return fetchAllSubjectsStatsEvent(_that);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that);case SetBaseStatsEvent() when setBaseStatsEvent != null:
return setBaseStatsEvent(_that);case SyncAttendanceDataEvent() when syncAttendanceDataEvent != null:
return syncAttendanceDataEvent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String? subjectId)?  fetchAttendance,TResult Function( String userId,  AttendanceEntity entity)?  addAttendance,TResult Function( String userId,  List<String>? timetableSubjects)?  fetchAllSubjectsStatsEvent,TResult Function( String userId,  String subjectId,  String lectureId,  AttendanceStatus status)?  updateLectureEvent,TResult Function( String userId,  String subjectId,  int attended,  int missed,  int cancelled)?  setBaseStatsEvent,TResult Function( String userId)?  syncAttendanceDataEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchAttendanceEvent() when fetchAttendance != null:
return fetchAttendance(_that.userId,_that.subjectId);case AddAttendanceEvent() when addAttendance != null:
return addAttendance(_that.userId,_that.entity);case FetchAllSubjectsStatsEvent() when fetchAllSubjectsStatsEvent != null:
return fetchAllSubjectsStatsEvent(_that.userId,_that.timetableSubjects);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that.userId,_that.subjectId,_that.lectureId,_that.status);case SetBaseStatsEvent() when setBaseStatsEvent != null:
return setBaseStatsEvent(_that.userId,_that.subjectId,_that.attended,_that.missed,_that.cancelled);case SyncAttendanceDataEvent() when syncAttendanceDataEvent != null:
return syncAttendanceDataEvent(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String? subjectId)  fetchAttendance,required TResult Function( String userId,  AttendanceEntity entity)  addAttendance,required TResult Function( String userId,  List<String>? timetableSubjects)  fetchAllSubjectsStatsEvent,required TResult Function( String userId,  String subjectId,  String lectureId,  AttendanceStatus status)  updateLectureEvent,required TResult Function( String userId,  String subjectId,  int attended,  int missed,  int cancelled)  setBaseStatsEvent,required TResult Function( String userId)  syncAttendanceDataEvent,}) {final _that = this;
switch (_that) {
case FetchAttendanceEvent():
return fetchAttendance(_that.userId,_that.subjectId);case AddAttendanceEvent():
return addAttendance(_that.userId,_that.entity);case FetchAllSubjectsStatsEvent():
return fetchAllSubjectsStatsEvent(_that.userId,_that.timetableSubjects);case UpdateLectureEvent():
return updateLectureEvent(_that.userId,_that.subjectId,_that.lectureId,_that.status);case SetBaseStatsEvent():
return setBaseStatsEvent(_that.userId,_that.subjectId,_that.attended,_that.missed,_that.cancelled);case SyncAttendanceDataEvent():
return syncAttendanceDataEvent(_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String? subjectId)?  fetchAttendance,TResult? Function( String userId,  AttendanceEntity entity)?  addAttendance,TResult? Function( String userId,  List<String>? timetableSubjects)?  fetchAllSubjectsStatsEvent,TResult? Function( String userId,  String subjectId,  String lectureId,  AttendanceStatus status)?  updateLectureEvent,TResult? Function( String userId,  String subjectId,  int attended,  int missed,  int cancelled)?  setBaseStatsEvent,TResult? Function( String userId)?  syncAttendanceDataEvent,}) {final _that = this;
switch (_that) {
case FetchAttendanceEvent() when fetchAttendance != null:
return fetchAttendance(_that.userId,_that.subjectId);case AddAttendanceEvent() when addAttendance != null:
return addAttendance(_that.userId,_that.entity);case FetchAllSubjectsStatsEvent() when fetchAllSubjectsStatsEvent != null:
return fetchAllSubjectsStatsEvent(_that.userId,_that.timetableSubjects);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that.userId,_that.subjectId,_that.lectureId,_that.status);case SetBaseStatsEvent() when setBaseStatsEvent != null:
return setBaseStatsEvent(_that.userId,_that.subjectId,_that.attended,_that.missed,_that.cancelled);case SyncAttendanceDataEvent() when syncAttendanceDataEvent != null:
return syncAttendanceDataEvent(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class FetchAttendanceEvent implements AttendanceEvent {
  const FetchAttendanceEvent({required this.userId, this.subjectId});
  

@override final  String userId;
 final  String? subjectId;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchAttendanceEventCopyWith<FetchAttendanceEvent> get copyWith => _$FetchAttendanceEventCopyWithImpl<FetchAttendanceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAttendanceEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,subjectId);

@override
String toString() {
  return 'AttendanceEvent.fetchAttendance(userId: $userId, subjectId: $subjectId)';
}


}

/// @nodoc
abstract mixin class $FetchAttendanceEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $FetchAttendanceEventCopyWith(FetchAttendanceEvent value, $Res Function(FetchAttendanceEvent) _then) = _$FetchAttendanceEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String? subjectId
});




}
/// @nodoc
class _$FetchAttendanceEventCopyWithImpl<$Res>
    implements $FetchAttendanceEventCopyWith<$Res> {
  _$FetchAttendanceEventCopyWithImpl(this._self, this._then);

  final FetchAttendanceEvent _self;
  final $Res Function(FetchAttendanceEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? subjectId = freezed,}) {
  return _then(FetchAttendanceEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AddAttendanceEvent implements AttendanceEvent {
  const AddAttendanceEvent({required this.userId, required this.entity});
  

@override final  String userId;
 final  AttendanceEntity entity;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAttendanceEventCopyWith<AddAttendanceEvent> get copyWith => _$AddAttendanceEventCopyWithImpl<AddAttendanceEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAttendanceEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.entity, entity) || other.entity == entity));
}


@override
int get hashCode => Object.hash(runtimeType,userId,entity);

@override
String toString() {
  return 'AttendanceEvent.addAttendance(userId: $userId, entity: $entity)';
}


}

/// @nodoc
abstract mixin class $AddAttendanceEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $AddAttendanceEventCopyWith(AddAttendanceEvent value, $Res Function(AddAttendanceEvent) _then) = _$AddAttendanceEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, AttendanceEntity entity
});




}
/// @nodoc
class _$AddAttendanceEventCopyWithImpl<$Res>
    implements $AddAttendanceEventCopyWith<$Res> {
  _$AddAttendanceEventCopyWithImpl(this._self, this._then);

  final AddAttendanceEvent _self;
  final $Res Function(AddAttendanceEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? entity = null,}) {
  return _then(AddAttendanceEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as AttendanceEntity,
  ));
}


}

/// @nodoc


class FetchAllSubjectsStatsEvent implements AttendanceEvent {
  const FetchAllSubjectsStatsEvent({required this.userId, final  List<String>? timetableSubjects}): _timetableSubjects = timetableSubjects;
  

@override final  String userId;
 final  List<String>? _timetableSubjects;
 List<String>? get timetableSubjects {
  final value = _timetableSubjects;
  if (value == null) return null;
  if (_timetableSubjects is EqualUnmodifiableListView) return _timetableSubjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchAllSubjectsStatsEventCopyWith<FetchAllSubjectsStatsEvent> get copyWith => _$FetchAllSubjectsStatsEventCopyWithImpl<FetchAllSubjectsStatsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAllSubjectsStatsEvent&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._timetableSubjects, _timetableSubjects));
}


@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(_timetableSubjects));

@override
String toString() {
  return 'AttendanceEvent.fetchAllSubjectsStatsEvent(userId: $userId, timetableSubjects: $timetableSubjects)';
}


}

/// @nodoc
abstract mixin class $FetchAllSubjectsStatsEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $FetchAllSubjectsStatsEventCopyWith(FetchAllSubjectsStatsEvent value, $Res Function(FetchAllSubjectsStatsEvent) _then) = _$FetchAllSubjectsStatsEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, List<String>? timetableSubjects
});




}
/// @nodoc
class _$FetchAllSubjectsStatsEventCopyWithImpl<$Res>
    implements $FetchAllSubjectsStatsEventCopyWith<$Res> {
  _$FetchAllSubjectsStatsEventCopyWithImpl(this._self, this._then);

  final FetchAllSubjectsStatsEvent _self;
  final $Res Function(FetchAllSubjectsStatsEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? timetableSubjects = freezed,}) {
  return _then(FetchAllSubjectsStatsEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,timetableSubjects: freezed == timetableSubjects ? _self._timetableSubjects : timetableSubjects // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class UpdateLectureEvent implements AttendanceEvent {
  const UpdateLectureEvent({required this.userId, required this.subjectId, required this.lectureId, required this.status});
  

@override final  String userId;
 final  String subjectId;
 final  String lectureId;
 final  AttendanceStatus status;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLectureEventCopyWith<UpdateLectureEvent> get copyWith => _$UpdateLectureEventCopyWithImpl<UpdateLectureEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLectureEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.lectureId, lectureId) || other.lectureId == lectureId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,userId,subjectId,lectureId,status);

@override
String toString() {
  return 'AttendanceEvent.updateLectureEvent(userId: $userId, subjectId: $subjectId, lectureId: $lectureId, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateLectureEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $UpdateLectureEventCopyWith(UpdateLectureEvent value, $Res Function(UpdateLectureEvent) _then) = _$UpdateLectureEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String subjectId, String lectureId, AttendanceStatus status
});




}
/// @nodoc
class _$UpdateLectureEventCopyWithImpl<$Res>
    implements $UpdateLectureEventCopyWith<$Res> {
  _$UpdateLectureEventCopyWithImpl(this._self, this._then);

  final UpdateLectureEvent _self;
  final $Res Function(UpdateLectureEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? subjectId = null,Object? lectureId = null,Object? status = null,}) {
  return _then(UpdateLectureEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,lectureId: null == lectureId ? _self.lectureId : lectureId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,
  ));
}


}

/// @nodoc


class SetBaseStatsEvent implements AttendanceEvent {
  const SetBaseStatsEvent({required this.userId, required this.subjectId, required this.attended, required this.missed, required this.cancelled});
  

@override final  String userId;
 final  String subjectId;
 final  int attended;
 final  int missed;
 final  int cancelled;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetBaseStatsEventCopyWith<SetBaseStatsEvent> get copyWith => _$SetBaseStatsEventCopyWithImpl<SetBaseStatsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetBaseStatsEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.attended, attended) || other.attended == attended)&&(identical(other.missed, missed) || other.missed == missed)&&(identical(other.cancelled, cancelled) || other.cancelled == cancelled));
}


@override
int get hashCode => Object.hash(runtimeType,userId,subjectId,attended,missed,cancelled);

@override
String toString() {
  return 'AttendanceEvent.setBaseStatsEvent(userId: $userId, subjectId: $subjectId, attended: $attended, missed: $missed, cancelled: $cancelled)';
}


}

/// @nodoc
abstract mixin class $SetBaseStatsEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $SetBaseStatsEventCopyWith(SetBaseStatsEvent value, $Res Function(SetBaseStatsEvent) _then) = _$SetBaseStatsEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String subjectId, int attended, int missed, int cancelled
});




}
/// @nodoc
class _$SetBaseStatsEventCopyWithImpl<$Res>
    implements $SetBaseStatsEventCopyWith<$Res> {
  _$SetBaseStatsEventCopyWithImpl(this._self, this._then);

  final SetBaseStatsEvent _self;
  final $Res Function(SetBaseStatsEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? subjectId = null,Object? attended = null,Object? missed = null,Object? cancelled = null,}) {
  return _then(SetBaseStatsEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as String,attended: null == attended ? _self.attended : attended // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,cancelled: null == cancelled ? _self.cancelled : cancelled // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SyncAttendanceDataEvent implements AttendanceEvent {
  const SyncAttendanceDataEvent({required this.userId});
  

@override final  String userId;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncAttendanceDataEventCopyWith<SyncAttendanceDataEvent> get copyWith => _$SyncAttendanceDataEventCopyWithImpl<SyncAttendanceDataEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncAttendanceDataEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'AttendanceEvent.syncAttendanceDataEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SyncAttendanceDataEventCopyWith<$Res> implements $AttendanceEventCopyWith<$Res> {
  factory $SyncAttendanceDataEventCopyWith(SyncAttendanceDataEvent value, $Res Function(SyncAttendanceDataEvent) _then) = _$SyncAttendanceDataEventCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$SyncAttendanceDataEventCopyWithImpl<$Res>
    implements $SyncAttendanceDataEventCopyWith<$Res> {
  _$SyncAttendanceDataEventCopyWithImpl(this._self, this._then);

  final SyncAttendanceDataEvent _self;
  final $Res Function(SyncAttendanceDataEvent) _then;

/// Create a copy of AttendanceEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(SyncAttendanceDataEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
