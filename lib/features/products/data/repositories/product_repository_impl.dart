//TODO: Criar implementação do repositório de produtos
import 'package:dio/dio.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/providers/dio_provider.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product_repository.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository{
  final Dio dio;
  
  ProductRepositoryImpl({required this.dio});

  Future<List<String>> findAll() async{
    final response = await dio.get('/categories');
    //Adicionando indexador 'name' em category para retornar somente os nomes das categorias
    return[for(final category in response.data as List) category['name'].toString()];

  }
  Future<List<Product>> findAllByCategories(String category) async {
    final response = await dio.get('/category/$category');
    return [
      for(final product in response.data['products'] as List) Product.fromJson(product)
    ];
  }
}

@riverpod
ProductRepositoryImpl productRepository(ProductRepositoryRef ref){
  return ProductRepositoryImpl(dio: ref.watch(dioProvider));
}
