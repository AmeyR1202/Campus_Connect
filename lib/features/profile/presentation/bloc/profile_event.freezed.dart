// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {

 String get userId; String get newUserName;
/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEventCopyWith<ProfileEvent> get copyWith => _$ProfileEventCopyWithImpl<ProfileEvent>(this as ProfileEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.newUserName, newUserName) || other.newUserName == newUserName));
}


@override
int get hashCode => Object.hash(runtimeType,userId,newUserName);

@override
String toString() {
  return 'ProfileEvent(userId: $userId, newUserName: $newUserName)';
}


}

/// @nodoc
abstract mixin class $ProfileEventCopyWith<$Res>  {
  factory $ProfileEventCopyWith(ProfileEvent value, $Res Function(ProfileEvent) _then) = _$ProfileEventCopyWithImpl;
@useResult
$Res call({
 String userId, String newUserName
});




}
/// @nodoc
class _$ProfileEventCopyWithImpl<$Res>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._self, this._then);

  final ProfileEvent _self;
  final $Res Function(ProfileEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? newUserName = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,newUserName: null == newUserName ? _self.newUserName : newUserName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateUsernameEvent value)?  updateUsernameEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateUsernameEvent() when updateUsernameEvent != null:
return updateUsernameEvent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateUsernameEvent value)  updateUsernameEvent,}){
final _that = this;
switch (_that) {
case UpdateUsernameEvent():
return updateUsernameEvent(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateUsernameEvent value)?  updateUsernameEvent,}){
final _that = this;
switch (_that) {
case UpdateUsernameEvent() when updateUsernameEvent != null:
return updateUsernameEvent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String newUserName)?  updateUsernameEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateUsernameEvent() when updateUsernameEvent != null:
return updateUsernameEvent(_that.userId,_that.newUserName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String newUserName)  updateUsernameEvent,}) {final _that = this;
switch (_that) {
case UpdateUsernameEvent():
return updateUsernameEvent(_that.userId,_that.newUserName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String newUserName)?  updateUsernameEvent,}) {final _that = this;
switch (_that) {
case UpdateUsernameEvent() when updateUsernameEvent != null:
return updateUsernameEvent(_that.userId,_that.newUserName);case _:
  return null;

}
}

}

/// @nodoc


class UpdateUsernameEvent implements ProfileEvent {
  const UpdateUsernameEvent({required this.userId, required this.newUserName});
  

@override final  String userId;
@override final  String newUserName;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUsernameEventCopyWith<UpdateUsernameEvent> get copyWith => _$UpdateUsernameEventCopyWithImpl<UpdateUsernameEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUsernameEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.newUserName, newUserName) || other.newUserName == newUserName));
}


@override
int get hashCode => Object.hash(runtimeType,userId,newUserName);

@override
String toString() {
  return 'ProfileEvent.updateUsernameEvent(userId: $userId, newUserName: $newUserName)';
}


}

/// @nodoc
abstract mixin class $UpdateUsernameEventCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateUsernameEventCopyWith(UpdateUsernameEvent value, $Res Function(UpdateUsernameEvent) _then) = _$UpdateUsernameEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String newUserName
});




}
/// @nodoc
class _$UpdateUsernameEventCopyWithImpl<$Res>
    implements $UpdateUsernameEventCopyWith<$Res> {
  _$UpdateUsernameEventCopyWithImpl(this._self, this._then);

  final UpdateUsernameEvent _self;
  final $Res Function(UpdateUsernameEvent) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? newUserName = null,}) {
  return _then(UpdateUsernameEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,newUserName: null == newUserName ? _self.newUserName : newUserName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
