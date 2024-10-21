//TODO: Criar implementação do repositório de produtos
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/providers/dio_provider.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product_repository.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository{
  final Dio dio;
  
  ProductRepositoryImpl({required this.dio});

  Future<List<String>> findAll() async{
    final response = await dio.get('/categories');
    return[for(final category in response.data as List) category.toString()];

  }
}

@riverpod
ProductRepositoryImpl productRepository(ProductRepositoryRef ref){
  return ProductRepositoryImpl(dio: ref.watch(dioProvider));
}
