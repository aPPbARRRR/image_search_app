import 'package:dio/dio.dart';
import 'package:search_pics_prac_app/data/dto/pixabay_image_Item_dto.dart';
import 'package:search_pics_prac_app/data/dto/pixabay_image_Item_dto_extention.dart';
import 'package:search_pics_prac_app/data/repository/image_repository.dart';
import 'package:search_pics_prac_app/domain/image_item.dart';

class PixabayImageRepositoryImpl implements ImageRepository {
  final Dio dio = Dio();

  @override
  Future<List<ImageItem>> fetchItems(
      {required String searchText, int? numOfItems, int? start}) async {
    var res = await dio.get('https://pixabay.com/api/', queryParameters: {
      'key': '41485225-3f4041e2c7a6d928e96f46c83',
      'q': searchText
    });
    if(res.statusCode == 200) {
      print(res.requestOptions.uri);
      List<dynamic> hits = res.data['hits'];
      List<PixabayImageItemDto> dtos =  hits.map((hit) => PixabayImageItemDto.fromJson(hit)).toList();
      List<ImageItem> items = dtos.map((dto) => dto.toImageItem(dto: dto)).toList();
      return items;
    }
    throw Exception('asdf');
  }
}
