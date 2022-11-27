// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryItemModel _$CategoryItemModelFromJson(Map<String, dynamic> json) {
  return _CategoryItemModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryItemModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  List<CategorySubItemsModel> get subItems =>
      throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryItemModelCopyWith<CategoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryItemModelCopyWith<$Res> {
  factory $CategoryItemModelCopyWith(
          CategoryItemModel value, $Res Function(CategoryItemModel) then) =
      _$CategoryItemModelCopyWithImpl<$Res, CategoryItemModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String desc,
      String? password,
      List<CategorySubItemsModel> subItems,
      int position,
      DateTime? createdDate});
}

/// @nodoc
class _$CategoryItemModelCopyWithImpl<$Res, $Val extends CategoryItemModel>
    implements $CategoryItemModelCopyWith<$Res> {
  _$CategoryItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? desc = null,
    Object? password = freezed,
    Object? subItems = null,
    Object? position = null,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      subItems: null == subItems
          ? _value.subItems
          : subItems // ignore: cast_nullable_to_non_nullable
              as List<CategorySubItemsModel>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryItemModelCopyWith<$Res>
    implements $CategoryItemModelCopyWith<$Res> {
  factory _$$_CategoryItemModelCopyWith(_$_CategoryItemModel value,
          $Res Function(_$_CategoryItemModel) then) =
      __$$_CategoryItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String desc,
      String? password,
      List<CategorySubItemsModel> subItems,
      int position,
      DateTime? createdDate});
}

/// @nodoc
class __$$_CategoryItemModelCopyWithImpl<$Res>
    extends _$CategoryItemModelCopyWithImpl<$Res, _$_CategoryItemModel>
    implements _$$_CategoryItemModelCopyWith<$Res> {
  __$$_CategoryItemModelCopyWithImpl(
      _$_CategoryItemModel _value, $Res Function(_$_CategoryItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? desc = null,
    Object? password = freezed,
    Object? subItems = null,
    Object? position = null,
    Object? createdDate = freezed,
  }) {
    return _then(_$_CategoryItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      subItems: null == subItems
          ? _value._subItems
          : subItems // ignore: cast_nullable_to_non_nullable
              as List<CategorySubItemsModel>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryItemModel implements _CategoryItemModel {
  _$_CategoryItemModel(
      {required this.id,
      required this.title,
      this.desc = "",
      this.password,
      final List<CategorySubItemsModel> subItems = const [],
      required this.position,
      this.createdDate})
      : _subItems = subItems;

  factory _$_CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryItemModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String desc;
  @override
  final String? password;
  final List<CategorySubItemsModel> _subItems;
  @override
  @JsonKey()
  List<CategorySubItemsModel> get subItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subItems);
  }

  @override
  final int position;
  @override
  final DateTime? createdDate;

  @override
  String toString() {
    return 'CategoryItemModel(id: $id, title: $title, desc: $desc, password: $password, subItems: $subItems, position: $position, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality().equals(other._subItems, _subItems) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, desc, password,
      const DeepCollectionEquality().hash(_subItems), position, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryItemModelCopyWith<_$_CategoryItemModel> get copyWith =>
      __$$_CategoryItemModelCopyWithImpl<_$_CategoryItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryItemModelToJson(
      this,
    );
  }
}

abstract class _CategoryItemModel implements CategoryItemModel {
  factory _CategoryItemModel(
      {required final String id,
      required final String title,
      final String desc,
      final String? password,
      final List<CategorySubItemsModel> subItems,
      required final int position,
      final DateTime? createdDate}) = _$_CategoryItemModel;

  factory _CategoryItemModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryItemModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get desc;
  @override
  String? get password;
  @override
  List<CategorySubItemsModel> get subItems;
  @override
  int get position;
  @override
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryItemModelCopyWith<_$_CategoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
