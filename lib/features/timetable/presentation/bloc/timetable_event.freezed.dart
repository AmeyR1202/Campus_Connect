// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimetableEvent {

 String get userId;
/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimetableEventCopyWith<TimetableEvent> get copyWith => _$TimetableEventCopyWithImpl<TimetableEvent>(this as TimetableEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimetableEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'TimetableEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TimetableEventCopyWith<$Res>  {
  factory $TimetableEventCopyWith(TimetableEvent value, $Res Function(TimetableEvent) _then) = _$TimetableEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$TimetableEventCopyWithImpl<$Res>
    implements $TimetableEventCopyWith<$Res> {
  _$TimetableEventCopyWithImpl(this._self, this._then);

  final TimetableEvent _self;
  final $Res Function(TimetableEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimetableEvent].
extension TimetableEventPatterns on TimetableEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddLectureEvent value)?  addLectureEvent,TResult Function( DeleteLectureEvent value)?  deleteLectureEvent,TResult Function( GetLecturesForDayEvent value)?  getLecturesForDayEvent,TResult Function( GetAllLecturesEvent value)?  getAllLecturesEvent,TResult Function( UpdateLectureEvent value)?  updateLectureEvent,TResult Function( SyncDataEvent value)?  syncDataEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddLectureEvent() when addLectureEvent != null:
return addLectureEvent(_that);case DeleteLectureEvent() when deleteLectureEvent != null:
return deleteLectureEvent(_that);case GetLecturesForDayEvent() when getLecturesForDayEvent != null:
return getLecturesForDayEvent(_that);case GetAllLecturesEvent() when getAllLecturesEvent != null:
return getAllLecturesEvent(_that);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that);case SyncDataEvent() when syncDataEvent != null:
return syncDataEvent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddLectureEvent value)  addLectureEvent,required TResult Function( DeleteLectureEvent value)  deleteLectureEvent,required TResult Function( GetLecturesForDayEvent value)  getLecturesForDayEvent,required TResult Function( GetAllLecturesEvent value)  getAllLecturesEvent,required TResult Function( UpdateLectureEvent value)  updateLectureEvent,required TResult Function( SyncDataEvent value)  syncDataEvent,}){
final _that = this;
switch (_that) {
case AddLectureEvent():
return addLectureEvent(_that);case DeleteLectureEvent():
return deleteLectureEvent(_that);case GetLecturesForDayEvent():
return getLecturesForDayEvent(_that);case GetAllLecturesEvent():
return getAllLecturesEvent(_that);case UpdateLectureEvent():
return updateLectureEvent(_that);case SyncDataEvent():
return syncDataEvent(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddLectureEvent value)?  addLectureEvent,TResult? Function( DeleteLectureEvent value)?  deleteLectureEvent,TResult? Function( GetLecturesForDayEvent value)?  getLecturesForDayEvent,TResult? Function( GetAllLecturesEvent value)?  getAllLecturesEvent,TResult? Function( UpdateLectureEvent value)?  updateLectureEvent,TResult? Function( SyncDataEvent value)?  syncDataEvent,}){
final _that = this;
switch (_that) {
case AddLectureEvent() when addLectureEvent != null:
return addLectureEvent(_that);case DeleteLectureEvent() when deleteLectureEvent != null:
return deleteLectureEvent(_that);case GetLecturesForDayEvent() when getLecturesForDayEvent != null:
return getLecturesForDayEvent(_that);case GetAllLecturesEvent() when getAllLecturesEvent != null:
return getAllLecturesEvent(_that);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that);case SyncDataEvent() when syncDataEvent != null:
return syncDataEvent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  LectureEntity entity)?  addLectureEvent,TResult Function( String userId,  String lectureId)?  deleteLectureEvent,TResult Function( String userId,  DateTime date)?  getLecturesForDayEvent,TResult Function( String userId)?  getAllLecturesEvent,TResult Function( String userId,  LectureEntity entity)?  updateLectureEvent,TResult Function( String userId)?  syncDataEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddLectureEvent() when addLectureEvent != null:
return addLectureEvent(_that.userId,_that.entity);case DeleteLectureEvent() when deleteLectureEvent != null:
return deleteLectureEvent(_that.userId,_that.lectureId);case GetLecturesForDayEvent() when getLecturesForDayEvent != null:
return getLecturesForDayEvent(_that.userId,_that.date);case GetAllLecturesEvent() when getAllLecturesEvent != null:
return getAllLecturesEvent(_that.userId);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that.userId,_that.entity);case SyncDataEvent() when syncDataEvent != null:
return syncDataEvent(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  LectureEntity entity)  addLectureEvent,required TResult Function( String userId,  String lectureId)  deleteLectureEvent,required TResult Function( String userId,  DateTime date)  getLecturesForDayEvent,required TResult Function( String userId)  getAllLecturesEvent,required TResult Function( String userId,  LectureEntity entity)  updateLectureEvent,required TResult Function( String userId)  syncDataEvent,}) {final _that = this;
switch (_that) {
case AddLectureEvent():
return addLectureEvent(_that.userId,_that.entity);case DeleteLectureEvent():
return deleteLectureEvent(_that.userId,_that.lectureId);case GetLecturesForDayEvent():
return getLecturesForDayEvent(_that.userId,_that.date);case GetAllLecturesEvent():
return getAllLecturesEvent(_that.userId);case UpdateLectureEvent():
return updateLectureEvent(_that.userId,_that.entity);case SyncDataEvent():
return syncDataEvent(_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  LectureEntity entity)?  addLectureEvent,TResult? Function( String userId,  String lectureId)?  deleteLectureEvent,TResult? Function( String userId,  DateTime date)?  getLecturesForDayEvent,TResult? Function( String userId)?  getAllLecturesEvent,TResult? Function( String userId,  LectureEntity entity)?  updateLectureEvent,TResult? Function( String userId)?  syncDataEvent,}) {final _that = this;
switch (_that) {
case AddLectureEvent() when addLectureEvent != null:
return addLectureEvent(_that.userId,_that.entity);case DeleteLectureEvent() when deleteLectureEvent != null:
return deleteLectureEvent(_that.userId,_that.lectureId);case GetLecturesForDayEvent() when getLecturesForDayEvent != null:
return getLecturesForDayEvent(_that.userId,_that.date);case GetAllLecturesEvent() when getAllLecturesEvent != null:
return getAllLecturesEvent(_that.userId);case UpdateLectureEvent() when updateLectureEvent != null:
return updateLectureEvent(_that.userId,_that.entity);case SyncDataEvent() when syncDataEvent != null:
return syncDataEvent(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class AddLectureEvent implements TimetableEvent {
  const AddLectureEvent({required this.userId, required this.entity});
  

@override final  String userId;
 final  LectureEntity entity;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddLectureEventCopyWith<AddLectureEvent> get copyWith => _$AddLectureEventCopyWithImpl<AddLectureEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddLectureEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.entity, entity) || other.entity == entity));
}


@override
int get hashCode => Object.hash(runtimeType,userId,entity);

@override
String toString() {
  return 'TimetableEvent.addLectureEvent(userId: $userId, entity: $entity)';
}


}

/// @nodoc
abstract mixin class $AddLectureEventCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory $AddLectureEventCopyWith(AddLectureEvent value, $Res Function(AddLectureEvent) _then) = _$AddLectureEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, LectureEntity entity
});




}
/// @nodoc
class _$AddLectureEventCopyWithImpl<$Res>
    implements $AddLectureEventCopyWith<$Res> {
  _$AddLectureEventCopyWithImpl(this._self, this._then);

  final AddLectureEvent _self;
  final $Res Function(AddLectureEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? entity = null,}) {
  return _then(AddLectureEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as LectureEntity,
  ));
}


}

/// @nodoc


class DeleteLectureEvent implements TimetableEvent {
  const DeleteLectureEvent({required this.userId, required this.lectureId});
  

@override final  String userId;
 final  String lectureId;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteLectureEventCopyWith<DeleteLectureEvent> get copyWith => _$DeleteLectureEventCopyWithImpl<DeleteLectureEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteLectureEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lectureId, lectureId) || other.lectureId == lectureId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,lectureId);

@override
String toString() {
  return 'TimetableEvent.deleteLectureEvent(userId: $userId, lectureId: $lectureId)';
}


}

/// @nodoc
abstract mixin class $DeleteLectureEventCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory $DeleteLectureEventCopyWith(DeleteLectureEvent value, $Res Function(DeleteLectureEvent) _then) = _$DeleteLectureEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String lectureId
});




}
/// @nodoc
class _$DeleteLectureEventCopyWithImpl<$Res>
    implements $DeleteLectureEventCopyWith<$Res> {
  _$DeleteLectureEventCopyWithImpl(this._self, this._then);

  final DeleteLectureEvent _self;
  final $Res Function(DeleteLectureEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? lectureId = null,}) {
  return _then(DeleteLectureEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lectureId: null == lectureId ? _self.lectureId : lectureId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetLecturesForDayEvent implements TimetableEvent {
  const GetLecturesForDayEvent({required this.userId, required this.date});
  

@override final  String userId;
 final  DateTime date;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetLecturesForDayEventCopyWith<GetLecturesForDayEvent> get copyWith => _$GetLecturesForDayEventCopyWithImpl<GetLecturesForDayEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetLecturesForDayEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,userId,date);

@override
String toString() {
  return 'TimetableEvent.getLecturesForDayEvent(userId: $userId, date: $date)';
}


}

/// @nodoc
abstract mixin class $GetLecturesForDayEventCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory $GetLecturesForDayEventCopyWith(GetLecturesForDayEvent value, $Res Function(GetLecturesForDayEvent) _then) = _$GetLecturesForDayEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, DateTime date
});




}
/// @nodoc
class _$GetLecturesForDayEventCopyWithImpl<$Res>
    implements $GetLecturesForDayEventCopyWith<$Res> {
  _$GetLecturesForDayEventCopyWithImpl(this._self, this._then);

  final GetLecturesForDayEvent _self;
  final $Res Function(GetLecturesForDayEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? date = null,}) {
  return _then(GetLecturesForDayEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class GetAllLecturesEvent implements TimetableEvent {
  const GetAllLecturesEvent({required this.userId});
  

@override final  String userId;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllLecturesEventCopyWith<GetAllLecturesEvent> get copyWith => _$GetAllLecturesEventCopyWithImpl<GetAllLecturesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllLecturesEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'TimetableEvent.getAllLecturesEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $GetAllLecturesEventCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory $GetAllLecturesEventCopyWith(GetAllLecturesEvent value, $Res Function(GetAllLecturesEvent) _then) = _$GetAllLecturesEventCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$GetAllLecturesEventCopyWithImpl<$Res>
    implements $GetAllLecturesEventCopyWith<$Res> {
  _$GetAllLecturesEventCopyWithImpl(this._self, this._then);

  final GetAllLecturesEvent _self;
  final $Res Function(GetAllLecturesEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(GetAllLecturesEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateLectureEvent implements TimetableEvent {
  const UpdateLectureEvent({required this.userId, required this.entity});
  

@override final  String userId;
 final  LectureEntity entity;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLectureEventCopyWith<UpdateLectureEvent> get copyWith => _$UpdateLectureEventCopyWithImpl<UpdateLectureEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLectureEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.entity, entity) || other.entity == entity));
}


@override
int get hashCode => Object.hash(runtimeType,userId,entity);

@override
String toString() {
  return 'TimetableEvent.updateLectureEvent(userId: $userId, entity: $entity)';
}


}

/// @nodoc
abstract mixin class $UpdateLectureEventCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory $UpdateLectureEventCopyWith(UpdateLectureEvent value, $Res Function(UpdateLectureEvent) _then) = _$UpdateLectureEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, LectureEntity entity
});




}
/// @nodoc
class _$UpdateLectureEventCopyWithImpl<$Res>
    implements $UpdateLectureEventCopyWith<$Res> {
  _$UpdateLectureEventCopyWithImpl(this._self, this._then);

  final UpdateLectureEvent _self;
  final $Res Function(UpdateLectureEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? entity = null,}) {
  return _then(UpdateLectureEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,entity: null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as LectureEntity,
  ));
}


}

/// @nodoc


class SyncDataEvent implements TimetableEvent {
  const SyncDataEvent({required this.userId});
  

@override final  String userId;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncDataEventCopyWith<SyncDataEvent> get copyWith => _$SyncDataEventCopyWithImpl<SyncDataEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncDataEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'TimetableEvent.syncDataEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SyncDataEventCopyWith<$Res> implements $TimetableEventCopyWith<$Res> {
  factory $SyncDataEventCopyWith(SyncDataEvent value, $Res Function(SyncDataEvent) _then) = _$SyncDataEventCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$SyncDataEventCopyWithImpl<$Res>
    implements $SyncDataEventCopyWith<$Res> {
  _$SyncDataEventCopyWithImpl(this._self, this._then);

  final SyncDataEvent _self;
  final $Res Function(SyncDataEvent) _then;

/// Create a copy of TimetableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(SyncDataEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
