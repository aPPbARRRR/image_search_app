// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:search_pics_prac_app/data/data_source/pixabay_image_repository_impl.dart';
import 'package:search_pics_prac_app/data/repository/image_repository.dart';

import '../../domain/image_item.dart';

class ViewController {

    ViewController({
    required this.repository,
  });

  final ImageRepository repository;
  List<ImageItem> items = [];


Future<void> fetchItems ({required String searchText, int? numOfItems, int? start}) async {
  items = await repository.fetchItems(searchText: searchText);
  print(items[0].tags);
}
}

