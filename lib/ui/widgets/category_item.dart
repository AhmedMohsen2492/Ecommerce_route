import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_route/data/model/response/category_dm.dart';
import 'package:ecommerce_route/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  List<CategoryDM> list ;
  int index ;

  CategoryItem(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        CachedNetworkImage(
            imageUrl: list[index].image ?? "",
          imageBuilder: (context, imageProvider) => Container(
           height:  MediaQuery.sizeOf(context).height* 0.1,
            width:  MediaQuery.sizeOf(context).width* 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(
            color: AppColors.primary,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Spacer(),
        Text(
            list[index].name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 14,
            fontWeight: FontWeight.normal
          ),
        ),
        Spacer(),
      ],
    );
  }
}