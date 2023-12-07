import 'package:unit_test/my_app/core/services/network_services.dart';
import 'package:unit_test/my_app/models/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getPost();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkServices networkServices;

  RemoteDataSourceImpl(this.networkServices);
  @override
  Future<List<PostModel>> getPost() async {
    final response =await networkServices.get('https://jsonplaceholder.typicode.com/posts');
    final result = response.data as Map;

  throw UnimplementedError();
  }

}
