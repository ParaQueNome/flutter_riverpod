//TODO: Criar o contrato para o repositório de produtos

abstract class ProductRepository {
  Future<List<String>> findAll();
}