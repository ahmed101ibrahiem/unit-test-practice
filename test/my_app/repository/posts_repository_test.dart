import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test/my_app/datasources/remote_datasource.dart';
import 'package:unit_test/my_app/models/post_model.dart';
import 'package:unit_test/my_app/repository/posts_repository.dart';

import 'posts_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  // if there check for connection data we can test loacl & remote data
  late RemoteDataSource mockRemoteDataSource;
  late PostsRepository postsRepository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    postsRepository = PostsRepositoryImpl(mockRemoteDataSource);

  });
  test('posts repository get a list of PostsModel', () async {
    // arrange
    final posts = [PostModel(userId: 1, id: 1, title: 'ahmed', body: 'body'),PostModel(userId:2, id: 2, title: 'mohamed', body: 'body1'),PostModel(userId: 3, id: 3, title: 'khaled', body: 'body2')];

      when(mockRemoteDataSource.getPosts()).thenAnswer((_) => Future.value(posts));

    // act
    final result =await postsRepository.getPosts();

    // assert
    expect(result, posts);
  });
}