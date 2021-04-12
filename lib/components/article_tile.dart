import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final String imageUrl, title, description;

  ArticleTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Card(
          child: Material(
            color: Colors.white.withOpacity(0),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        // height: 70,
                        // width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
