import '../../domain/image_item.dart';

abstract interface class ImageRepository {

  // 검색어, 반환할 갯수, 검색시작 갯수 받아서 검색하고, 검색된 결과를List<Pic> 반환
  Future<List<ImageItem>> fetchItems ({required String searchText, int? numOfItems, int? start});

}