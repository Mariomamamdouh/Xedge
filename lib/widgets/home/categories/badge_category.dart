import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nyoba/pages/category/brand_product_screen.dart';
import 'package:nyoba/pages/category/category_screen.dart';
import 'package:nyoba/utils/utility.dart';

import '../../../app_localizations.dart';

class BadgeCategory extends StatelessWidget {
  final List dataCategories;

  BadgeCategory(this.dataCategories);

  final int item = 6;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 7,
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            var categories = dataCategories[i];
            var imageCategories = categories.image;
            var titleCategories = categories.titleCategories;

            return Container(
                margin: EdgeInsets.only(
                    left: i == 0 ? 15 : 0,
                    right: i == dataCategories.length - 1 ? 15 : 0),
                width: MediaQuery.of(context).size.width / 6,
                child: InkWell(
                  onTap: () {
                    if (titleCategories == AppLocalizations.of(context)!
                        .translate('view_more')) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                isFromHome: false,
                              )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BrandProducts(
                                categoryId: dataCategories[i].categories.toString(),
                                brandName:
                                dataCategories[i].titleCategories,
                              )));
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          flex: 3,
                          child: itemCategory(imageCategories, i,
                              type: titleCategories == AppLocalizations.of(context)!
                                  .translate('view_more')
                                  ? 'asset'
                                  : 'url')),
                      Container(
                        height: 5,
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          child: Text(
                            convertHtmlUnescape(titleCategories),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: responsiveFont(8),
                                height: 1,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 15,
            );
          },
          itemCount: dataCategories.length),
    );
  }

  Widget itemCategory(String? image, int i, {String type = 'url'}) {
    return Container(
      padding: EdgeInsets.all(5),
      child:  CachedNetworkImage(
          imageUrl: image!,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context,url,error)=>Image(image: AssetImage("images/lobby/viewMore.png"),),
          imageBuilder:(context,url)=> Image.network(image!)) ,
    );
  }
}
