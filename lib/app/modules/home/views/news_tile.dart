import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum1/app/modules/models/news.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  const NewsTile(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    article.urlToImage.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '\$${article.title}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')
            ),
            SizedBox(height: 8),
            if (article.source.name != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      article.author.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text(article.description,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}