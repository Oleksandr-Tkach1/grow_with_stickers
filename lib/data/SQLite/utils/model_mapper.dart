import 'package:grow_with_stickers/data/SQLite/entity/book_entity.dart';
import 'package:grow_with_stickers/data/SQLite/entity/page_entity.dart';
import 'package:grow_with_stickers/data/SQLite/entity/sticker_entity.dart';
import 'package:grow_with_stickers/data/models/response/book/book.dart';
import 'package:grow_with_stickers/data/models/response/book/page.dart';
import 'package:grow_with_stickers/data/models/response/book/sticker.dart';
import 'package:grow_with_stickers/utils/firebase/getting_image_from_firebase_storage.dart';

abstract class Mapper {
  Future<List<BookEntity>> mapBook(List<Book> book);
}

class ModelMapper extends Mapper {
  @override
  Future<List<BookEntity>> mapBook(List<Book> books) async {
    List<BookEntity> mappedBooksEntity = [];
    for (var book in books) {
      final List<PageEntity>? mappedPages = book.page != null ? await mapPage(book.page!) : null;
      final List<StickerEntity>? mappedStickers = book.sticker != null ? await mapSticker(book.sticker!) : null;

      String coverUrl = '';
      try {
        coverUrl = await GettingImageFromFirebaseStorage.getImageFromStorage(book.coverUrl!);
      } catch (e) {
        print('Error fetching cover image: $e');
      }

      final BookEntity mappedBook = BookEntity(
        page: mappedPages,
        sticker: mappedStickers,
        titleRu: book.titleRu,
        coverUrl: coverUrl,
        productId: book.productId,
        titleUa: book.titleUa,
        free: book.free,
        category: book.category,
        title: book.title,
      );
      mappedBooksEntity.add(mappedBook);
    }
    return mappedBooksEntity;
  }

  Future<List<PageEntity>> mapPage(List<Page> pages) async {
    List<PageEntity> mappedPageEntity = [];
    for (var page in pages) {
      String backgroundUrl = '';
      try {
        backgroundUrl = await GettingImageFromFirebaseStorage.getImageFromStorage(page.backgroundUrl!);
      } catch (e) {
        print('Error fetching page background image: $e');
      }

      final PageEntity mappedPage = PageEntity(
        backgroundUrl: backgroundUrl,
        payload: page.payload,
        taskRu: page.taskRu,
        task: page.task,
        taskUa: page.taskUa,
        title: page.title,
        titleRu: page.titleRu,
        titleUa: page.titleUa,
      );
      mappedPageEntity.add(mappedPage);
    }
    return mappedPageEntity;
  }

  Future<List<StickerEntity>> mapSticker(List<Sticker>? stickers) async{
    List<StickerEntity> mappedStickerEntity = [];
    for (var sticker in stickers!) {
      String coverUrl = '';
      try {
        coverUrl = await GettingImageFromFirebaseStorage.getImageFromStorage(sticker.coverUrl!);
      } catch (e) {
        print('Error fetching cover image: $e');
      }
      final StickerEntity mappedSticker = StickerEntity(
        coverUrl: coverUrl,
      );
      mappedStickerEntity.add(mappedSticker);
    }
    return mappedStickerEntity;
  }
}