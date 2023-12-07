import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test/my_app/bloc/cubit/posts_cubit.dart';
import 'package:unit_test/my_app/models/post_model.dart';
import 'package:unit_test/my_app/repository/posts_repository.dart';

import 'posts_cubit_test.mocks.dart';
@GenerateMocks([PostsRepository])
void main() {
  late PostsRepository postsRepository;
  late PostsCubit postsCubit;

  setUp(() {
    postsRepository = MockPostsRepository();
    postsCubit = PostsCubit(postsRepository);
  });
  test('posts cubit get a list of Postmodel then path through Loaded state || emit LoadingState then emit Loaded State',
   () async {
    // arrange
     final posts = List.generate(
        5,
        (index) => PostModel(
            id: index,
            userId: index,
            title: 'title $index',
            body: 'body $index'));
    when(postsRepository.getPosts()).thenAnswer((_) => Future.value(posts));
    
    // assert

    final expectedStates = [
      const PostsLoading(),
      PostsLoaded(posts),
    ];

    expectLater(postsCubit.stream, emitsInAnyOrder(expectedStates));

    // act
     postsCubit.loadPosts();
  });
}