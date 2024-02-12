import 'package:flutter/material.dart';
import 'package:grow_with_stickers/utils/ui/text_style.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategory('LEARNING NUMBERS', 0, Color(0XFF6B51BF)),
          _buildCategory('LEARNING ALPHABET', 1, Color(0XFFFEC203)),
          _buildCategory('HIGH OR LOW', 2, Color(0XFFFF7B6A)),
          _buildCategory('MANY OTHERS', 3, Color(0XFF74CE5A)),
          _buildCategory('LEARNING ALPHABET', 4, Color(0XFF3BBDF7)),
        ],
      ),
    );
  }

  Widget _buildCategory(String title, int index, Color color) {
    bool isSelected = index == selectedIndex;
    double height = isSelected ? 102 : 78;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        width: MediaQuery.of(context).size.width / 5.2,
        height: height,
      ),
    );
  }
}
