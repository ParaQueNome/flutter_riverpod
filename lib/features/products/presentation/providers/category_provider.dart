//TODO: Criar o provedor de categorias

import 'package:from_zero_to_hero_ht/features/products/data/product_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';



@riverpod
FutureOr<List<String>> categories(CategoriesRef ref) async {
  final categories = await ref.watch(productRepositoryProvider).findAllCategories();
  return categories;
}