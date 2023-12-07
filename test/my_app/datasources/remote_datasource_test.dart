import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test/my_app/core/services/network_service.dart';
import 'package:unit_test/my_app/datasources/remote_datasource.dart';
import 'package:unit_test/my_app/models/post_model.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late NetworkService networkService;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    networkService = MockNetworkService();
    remoteDataSource = RemoteDataSourceImpl(networkService);
  });
  test('remote datasource get list of PostModel', () async {
    // arrange
    final posts = List.generate(8, (index) {
      return PostModel(
          userId: index, id: index, title: 'title $index', body: 'body $index');
    });
    final postMap = posts.map((post) => post.toMap()).toList();
    when(networkService.get('https://jsonplaceholder.typicode.com/posts'))
        .thenAnswer((_) => Future.value(Response(
            requestOptions: RequestOptions(
                baseUrl: 'https://jsonplaceholder.typicode.com/posts'),
            data: postMap,
            statusCode: 200)));

    // act
    final result =await remoteDataSource.getPosts();

    // asset
    expect(result, posts);
  });


  test('throw exception if status code is not 200', () {
     // arrange
   final expextValue = throwsA(isA<Exception>());
    when(networkService.get('https://jsonplaceholder.typicode.com/posts'))
        .thenAnswer((_) => Future.value(Response(
            requestOptions: RequestOptions(
                baseUrl: 'https://jsonplaceholder.typicode.com/posts'),
            statusCode: 404)));

    // act
    result()async=> await remoteDataSource.getPosts();

    // asset
    expect(result, expextValue);
  });
}
