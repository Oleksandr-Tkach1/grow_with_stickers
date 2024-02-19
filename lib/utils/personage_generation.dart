import 'dart:math';
import 'package:grow_with_stickers/utils/ui/path_images.dart';

String generationPersonage(){
  int randomIndex = Random().nextInt(PathImages.personages.length);
  String randomPersonage = PathImages.personages[randomIndex];
  return randomPersonage;
}