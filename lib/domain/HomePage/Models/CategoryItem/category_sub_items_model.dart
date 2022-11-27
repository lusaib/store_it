import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_sub_items_model.freezed.dart';
part 'category_sub_items_model.g.dart';

@freezed
class CategorySubItemsModel with _$CategorySubItemsModel {
  factory CategorySubItemsModel({
    required String id,
    required String item,
    required String value,
    @Default("") String desc,
    required int position,
    DateTime? createdDate,
  }) = _CategorySubItemsModel;

  factory CategorySubItemsModel.fromJson(Map<String, Object?> json) =>
      _$CategorySubItemsModelFromJson(json);
}
