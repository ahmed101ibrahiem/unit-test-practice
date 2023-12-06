import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test/my_app/core/services/network_services.dart';
import 'package:unit_test/my_app/datasource/remote_datasource.dart';
import 'package:unit_test/my_app/models/post_model.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([NetworkServices])
void main() {
  /// asset
  late final RemoteDataSourceImpl remoteDataSourceImpl;
  late final NetworkServices mockNetworkServices;

  setUp(() {
    mockNetworkServices = MockNetworkServices();
    remoteDataSourceImpl = RemoteDataSourceImpl(mockNetworkServices);
  });

  test('Get post should return posts without any exception', () async {
    // arrange
    final Posts = List.generate(
        5,
        (index) => PostModel(
            userId: index,
            id: index,
            title: 'title $index',
            body: 'body $index'));

            final postsMap = Posts.map((post) => post.toMap()).toList();
            when(mockNetworkServices.get('https://jsonplaceholder.typicode.com/posts')).thenAnswer((_) => 
            Future.value(Response(requestOptions:RequestOptions(path:'https://jsonplaceholder.typicode.com/posts' ),
            data: postsMap,statusCode: 200,
             )));
    // act
  final result =   await remoteDataSourceImpl.getPost();

  // assert
  expect(result, Posts);
  });
}
