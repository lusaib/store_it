import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_sub_items_model.dart';
part 'category_item_model.freezed.dart';
part 'category_item_model.g.dart';

@freezed
class CategoryItemModel with _$CategoryItemModel {
  factory CategoryItemModel({
    required String id,
    required String title,
    @Default("") String desc,
    String? password,
    @Default([]) List<CategorySubItemsModel> subItems,
    required int position,
    DateTime? createdDate,
  }) = _CategoryItemModel;

  factory CategoryItemModel.fromJson(Map<String, Object?> json) =>
      _$CategoryItemModelFromJson(json);
}
