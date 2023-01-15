import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_item_model.freezed.dart';
part 'category_item_model.g.dart';

@freezed
class CategoryItemModel with _$CategoryItemModel {
  factory CategoryItemModel({
    required String id,
    required String title,
    @Default("") String desc,
    String? password,
    required int position,
    @TimestampConverter() required DateTime createdDate,
    @TimestampConverter() required DateTime modifiedDate,
  }) = _CategoryItemModel;

  factory CategoryItemModel.fromJson(Map<String, Object?> json) =>
      _$CategoryItemModelFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}
