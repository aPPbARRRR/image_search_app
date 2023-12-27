import '../../domain/image_item.dart';
import 'pixabay_image_Item_dto.dart';

extension PixabayImageItemDtoExtention on PixabayImageItemDto {
  ImageItem toImageItem({required PixabayImageItemDto dto}) => ImageItem(
      id: dto.id ?? 0,
      tags: tags ?? 'missing',
      previewURL: dto.previewURL ?? '',
      largeImageURL: dto.largeImageURL ?? '');
}
