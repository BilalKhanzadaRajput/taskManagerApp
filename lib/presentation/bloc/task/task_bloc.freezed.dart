// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskEvent()';
}


}

/// @nodoc
class $TaskEventCopyWith<$Res>  {
$TaskEventCopyWith(TaskEvent _, $Res Function(TaskEvent) __);
}


/// Adds pattern-matching-related methods to [TaskEvent].
extension TaskEventPatterns on TaskEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OnLoadTasks value)?  onLoadTasks,TResult Function( _OnAddTask value)?  onAddTask,TResult Function( _OnUpdateTask value)?  onUpdateTask,TResult Function( _OnDeleteTask value)?  onDeleteTask,TResult Function( _OnToggleTask value)?  onToggleTask,TResult Function( _OnSearchTasks value)?  onSearchTasks,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnLoadTasks() when onLoadTasks != null:
return onLoadTasks(_that);case _OnAddTask() when onAddTask != null:
return onAddTask(_that);case _OnUpdateTask() when onUpdateTask != null:
return onUpdateTask(_that);case _OnDeleteTask() when onDeleteTask != null:
return onDeleteTask(_that);case _OnToggleTask() when onToggleTask != null:
return onToggleTask(_that);case _OnSearchTasks() when onSearchTasks != null:
return onSearchTasks(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OnLoadTasks value)  onLoadTasks,required TResult Function( _OnAddTask value)  onAddTask,required TResult Function( _OnUpdateTask value)  onUpdateTask,required TResult Function( _OnDeleteTask value)  onDeleteTask,required TResult Function( _OnToggleTask value)  onToggleTask,required TResult Function( _OnSearchTasks value)  onSearchTasks,}){
final _that = this;
switch (_that) {
case _OnLoadTasks():
return onLoadTasks(_that);case _OnAddTask():
return onAddTask(_that);case _OnUpdateTask():
return onUpdateTask(_that);case _OnDeleteTask():
return onDeleteTask(_that);case _OnToggleTask():
return onToggleTask(_that);case _OnSearchTasks():
return onSearchTasks(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OnLoadTasks value)?  onLoadTasks,TResult? Function( _OnAddTask value)?  onAddTask,TResult? Function( _OnUpdateTask value)?  onUpdateTask,TResult? Function( _OnDeleteTask value)?  onDeleteTask,TResult? Function( _OnToggleTask value)?  onToggleTask,TResult? Function( _OnSearchTasks value)?  onSearchTasks,}){
final _that = this;
switch (_that) {
case _OnLoadTasks() when onLoadTasks != null:
return onLoadTasks(_that);case _OnAddTask() when onAddTask != null:
return onAddTask(_that);case _OnUpdateTask() when onUpdateTask != null:
return onUpdateTask(_that);case _OnDeleteTask() when onDeleteTask != null:
return onDeleteTask(_that);case _OnToggleTask() when onToggleTask != null:
return onToggleTask(_that);case _OnSearchTasks() when onSearchTasks != null:
return onSearchTasks(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int limit,  int skip)?  onLoadTasks,TResult Function( String todo,  bool completed,  int userId)?  onAddTask,TResult Function( int id,  String? todo,  bool? completed,  int? userId)?  onUpdateTask,TResult Function( int id)?  onDeleteTask,TResult Function( int id,  bool completed)?  onToggleTask,TResult Function( String query)?  onSearchTasks,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnLoadTasks() when onLoadTasks != null:
return onLoadTasks(_that.limit,_that.skip);case _OnAddTask() when onAddTask != null:
return onAddTask(_that.todo,_that.completed,_that.userId);case _OnUpdateTask() when onUpdateTask != null:
return onUpdateTask(_that.id,_that.todo,_that.completed,_that.userId);case _OnDeleteTask() when onDeleteTask != null:
return onDeleteTask(_that.id);case _OnToggleTask() when onToggleTask != null:
return onToggleTask(_that.id,_that.completed);case _OnSearchTasks() when onSearchTasks != null:
return onSearchTasks(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int limit,  int skip)  onLoadTasks,required TResult Function( String todo,  bool completed,  int userId)  onAddTask,required TResult Function( int id,  String? todo,  bool? completed,  int? userId)  onUpdateTask,required TResult Function( int id)  onDeleteTask,required TResult Function( int id,  bool completed)  onToggleTask,required TResult Function( String query)  onSearchTasks,}) {final _that = this;
switch (_that) {
case _OnLoadTasks():
return onLoadTasks(_that.limit,_that.skip);case _OnAddTask():
return onAddTask(_that.todo,_that.completed,_that.userId);case _OnUpdateTask():
return onUpdateTask(_that.id,_that.todo,_that.completed,_that.userId);case _OnDeleteTask():
return onDeleteTask(_that.id);case _OnToggleTask():
return onToggleTask(_that.id,_that.completed);case _OnSearchTasks():
return onSearchTasks(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int limit,  int skip)?  onLoadTasks,TResult? Function( String todo,  bool completed,  int userId)?  onAddTask,TResult? Function( int id,  String? todo,  bool? completed,  int? userId)?  onUpdateTask,TResult? Function( int id)?  onDeleteTask,TResult? Function( int id,  bool completed)?  onToggleTask,TResult? Function( String query)?  onSearchTasks,}) {final _that = this;
switch (_that) {
case _OnLoadTasks() when onLoadTasks != null:
return onLoadTasks(_that.limit,_that.skip);case _OnAddTask() when onAddTask != null:
return onAddTask(_that.todo,_that.completed,_that.userId);case _OnUpdateTask() when onUpdateTask != null:
return onUpdateTask(_that.id,_that.todo,_that.completed,_that.userId);case _OnDeleteTask() when onDeleteTask != null:
return onDeleteTask(_that.id);case _OnToggleTask() when onToggleTask != null:
return onToggleTask(_that.id,_that.completed);case _OnSearchTasks() when onSearchTasks != null:
return onSearchTasks(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _OnLoadTasks implements TaskEvent {
  const _OnLoadTasks({this.limit = 10, this.skip = 0});
  

@JsonKey() final  int limit;
@JsonKey() final  int skip;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnLoadTasksCopyWith<_OnLoadTasks> get copyWith => __$OnLoadTasksCopyWithImpl<_OnLoadTasks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnLoadTasks&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.skip, skip) || other.skip == skip));
}


@override
int get hashCode => Object.hash(runtimeType,limit,skip);

@override
String toString() {
  return 'TaskEvent.onLoadTasks(limit: $limit, skip: $skip)';
}


}

/// @nodoc
abstract mixin class _$OnLoadTasksCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$OnLoadTasksCopyWith(_OnLoadTasks value, $Res Function(_OnLoadTasks) _then) = __$OnLoadTasksCopyWithImpl;
@useResult
$Res call({
 int limit, int skip
});




}
/// @nodoc
class __$OnLoadTasksCopyWithImpl<$Res>
    implements _$OnLoadTasksCopyWith<$Res> {
  __$OnLoadTasksCopyWithImpl(this._self, this._then);

  final _OnLoadTasks _self;
  final $Res Function(_OnLoadTasks) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? skip = null,}) {
  return _then(_OnLoadTasks(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OnAddTask implements TaskEvent {
  const _OnAddTask({required this.todo, required this.completed, required this.userId});
  

 final  String todo;
 final  bool completed;
 final  int userId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnAddTaskCopyWith<_OnAddTask> get copyWith => __$OnAddTaskCopyWithImpl<_OnAddTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnAddTask&&(identical(other.todo, todo) || other.todo == todo)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,todo,completed,userId);

@override
String toString() {
  return 'TaskEvent.onAddTask(todo: $todo, completed: $completed, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$OnAddTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$OnAddTaskCopyWith(_OnAddTask value, $Res Function(_OnAddTask) _then) = __$OnAddTaskCopyWithImpl;
@useResult
$Res call({
 String todo, bool completed, int userId
});




}
/// @nodoc
class __$OnAddTaskCopyWithImpl<$Res>
    implements _$OnAddTaskCopyWith<$Res> {
  __$OnAddTaskCopyWithImpl(this._self, this._then);

  final _OnAddTask _self;
  final $Res Function(_OnAddTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,Object? completed = null,Object? userId = null,}) {
  return _then(_OnAddTask(
todo: null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OnUpdateTask implements TaskEvent {
  const _OnUpdateTask({required this.id, this.todo, this.completed, this.userId});
  

 final  int id;
 final  String? todo;
 final  bool? completed;
 final  int? userId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnUpdateTaskCopyWith<_OnUpdateTask> get copyWith => __$OnUpdateTaskCopyWithImpl<_OnUpdateTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnUpdateTask&&(identical(other.id, id) || other.id == id)&&(identical(other.todo, todo) || other.todo == todo)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,todo,completed,userId);

@override
String toString() {
  return 'TaskEvent.onUpdateTask(id: $id, todo: $todo, completed: $completed, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$OnUpdateTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$OnUpdateTaskCopyWith(_OnUpdateTask value, $Res Function(_OnUpdateTask) _then) = __$OnUpdateTaskCopyWithImpl;
@useResult
$Res call({
 int id, String? todo, bool? completed, int? userId
});




}
/// @nodoc
class __$OnUpdateTaskCopyWithImpl<$Res>
    implements _$OnUpdateTaskCopyWith<$Res> {
  __$OnUpdateTaskCopyWithImpl(this._self, this._then);

  final _OnUpdateTask _self;
  final $Res Function(_OnUpdateTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? todo = freezed,Object? completed = freezed,Object? userId = freezed,}) {
  return _then(_OnUpdateTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,todo: freezed == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as String?,completed: freezed == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _OnDeleteTask implements TaskEvent {
  const _OnDeleteTask({required this.id});
  

 final  int id;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnDeleteTaskCopyWith<_OnDeleteTask> get copyWith => __$OnDeleteTaskCopyWithImpl<_OnDeleteTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnDeleteTask&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TaskEvent.onDeleteTask(id: $id)';
}


}

/// @nodoc
abstract mixin class _$OnDeleteTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$OnDeleteTaskCopyWith(_OnDeleteTask value, $Res Function(_OnDeleteTask) _then) = __$OnDeleteTaskCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$OnDeleteTaskCopyWithImpl<$Res>
    implements _$OnDeleteTaskCopyWith<$Res> {
  __$OnDeleteTaskCopyWithImpl(this._self, this._then);

  final _OnDeleteTask _self;
  final $Res Function(_OnDeleteTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_OnDeleteTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OnToggleTask implements TaskEvent {
  const _OnToggleTask({required this.id, required this.completed});
  

 final  int id;
 final  bool completed;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnToggleTaskCopyWith<_OnToggleTask> get copyWith => __$OnToggleTaskCopyWithImpl<_OnToggleTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnToggleTask&&(identical(other.id, id) || other.id == id)&&(identical(other.completed, completed) || other.completed == completed));
}


@override
int get hashCode => Object.hash(runtimeType,id,completed);

@override
String toString() {
  return 'TaskEvent.onToggleTask(id: $id, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$OnToggleTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$OnToggleTaskCopyWith(_OnToggleTask value, $Res Function(_OnToggleTask) _then) = __$OnToggleTaskCopyWithImpl;
@useResult
$Res call({
 int id, bool completed
});




}
/// @nodoc
class __$OnToggleTaskCopyWithImpl<$Res>
    implements _$OnToggleTaskCopyWith<$Res> {
  __$OnToggleTaskCopyWithImpl(this._self, this._then);

  final _OnToggleTask _self;
  final $Res Function(_OnToggleTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? completed = null,}) {
  return _then(_OnToggleTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _OnSearchTasks implements TaskEvent {
  const _OnSearchTasks({required this.query});
  

 final  String query;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnSearchTasksCopyWith<_OnSearchTasks> get copyWith => __$OnSearchTasksCopyWithImpl<_OnSearchTasks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnSearchTasks&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'TaskEvent.onSearchTasks(query: $query)';
}


}

/// @nodoc
abstract mixin class _$OnSearchTasksCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory _$OnSearchTasksCopyWith(_OnSearchTasks value, $Res Function(_OnSearchTasks) _then) = __$OnSearchTasksCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$OnSearchTasksCopyWithImpl<$Res>
    implements _$OnSearchTasksCopyWith<$Res> {
  __$OnSearchTasksCopyWithImpl(this._self, this._then);

  final _OnSearchTasks _self;
  final $Res Function(_OnSearchTasks) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_OnSearchTasks(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TaskState {

 bool get isLoading; List<TaskEntity> get tasks; int get total; int get skip; int get limit; bool get hasMore; String get searchQuery; String? get errorMessage;
/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStateCopyWith<TaskState> get copyWith => _$TaskStateCopyWithImpl<TaskState>(this as TaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(tasks),total,skip,limit,hasMore,searchQuery,errorMessage);

@override
String toString() {
  return 'TaskState(isLoading: $isLoading, tasks: $tasks, total: $total, skip: $skip, limit: $limit, hasMore: $hasMore, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TaskStateCopyWith<$Res>  {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) _then) = _$TaskStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<TaskEntity> tasks, int total, int skip, int limit, bool hasMore, String searchQuery, String? errorMessage
});




}
/// @nodoc
class _$TaskStateCopyWithImpl<$Res>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._self, this._then);

  final TaskState _self;
  final $Res Function(TaskState) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? tasks = null,Object? total = null,Object? skip = null,Object? limit = null,Object? hasMore = null,Object? searchQuery = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskState].
extension TaskStatePatterns on TaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskState value)  $default,){
final _that = this;
switch (_that) {
case _TaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskState value)?  $default,){
final _that = this;
switch (_that) {
case _TaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<TaskEntity> tasks,  int total,  int skip,  int limit,  bool hasMore,  String searchQuery,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskState() when $default != null:
return $default(_that.isLoading,_that.tasks,_that.total,_that.skip,_that.limit,_that.hasMore,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<TaskEntity> tasks,  int total,  int skip,  int limit,  bool hasMore,  String searchQuery,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TaskState():
return $default(_that.isLoading,_that.tasks,_that.total,_that.skip,_that.limit,_that.hasMore,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<TaskEntity> tasks,  int total,  int skip,  int limit,  bool hasMore,  String searchQuery,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TaskState() when $default != null:
return $default(_that.isLoading,_that.tasks,_that.total,_that.skip,_that.limit,_that.hasMore,_that.searchQuery,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TaskState implements TaskState {
  const _TaskState({this.isLoading = false, final  List<TaskEntity> tasks = const [], this.total = 0, this.skip = 0, this.limit = 10, this.hasMore = false, this.searchQuery = '', this.errorMessage}): _tasks = tasks;
  

@override@JsonKey() final  bool isLoading;
 final  List<TaskEntity> _tasks;
@override@JsonKey() List<TaskEntity> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int skip;
@override@JsonKey() final  int limit;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  String searchQuery;
@override final  String? errorMessage;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskStateCopyWith<_TaskState> get copyWith => __$TaskStateCopyWithImpl<_TaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.total, total) || other.total == total)&&(identical(other.skip, skip) || other.skip == skip)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_tasks),total,skip,limit,hasMore,searchQuery,errorMessage);

@override
String toString() {
  return 'TaskState(isLoading: $isLoading, tasks: $tasks, total: $total, skip: $skip, limit: $limit, hasMore: $hasMore, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TaskStateCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory _$TaskStateCopyWith(_TaskState value, $Res Function(_TaskState) _then) = __$TaskStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<TaskEntity> tasks, int total, int skip, int limit, bool hasMore, String searchQuery, String? errorMessage
});




}
/// @nodoc
class __$TaskStateCopyWithImpl<$Res>
    implements _$TaskStateCopyWith<$Res> {
  __$TaskStateCopyWithImpl(this._self, this._then);

  final _TaskState _self;
  final $Res Function(_TaskState) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? tasks = null,Object? total = null,Object? skip = null,Object? limit = null,Object? hasMore = null,Object? searchQuery = null,Object? errorMessage = freezed,}) {
  return _then(_TaskState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskEntity>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,skip: null == skip ? _self.skip : skip // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
