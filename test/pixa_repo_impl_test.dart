import 'package:flutter_test/flutter_test.dart';
import 'package:search_pics_prac_app/data/data_source/pixabay_image_repository_impl.dart';

void main () {

  test('repo', () async {

    final repo = PixabayImageRepositoryImpl();

    // repo.fetchItems(searchText: 'flower');
    expect(await repo.fetchItems(searchText: 'flower'), []);

  });
}