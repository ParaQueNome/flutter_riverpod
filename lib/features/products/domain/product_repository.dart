//TODO: Criar o contrato para o repositório de produtos

import 'package:from_zero_to_hero_ht/features/products/domain/product.dart';

abstract class ProductRepository {
  Future<List<String>> findAll();
  Future<List<Product>> findAllByCategories(String category);
}