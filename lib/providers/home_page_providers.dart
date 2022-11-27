import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_item_model.dart';

final selectedGeneralItemProvider =
    StateProvider<CategoryItemModel?>((ref) => null);
