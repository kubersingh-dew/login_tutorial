import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../datamodel/Data.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key,required this.title, required this.subtitle,
  required this.bannerImg, required this.data});

  final String title;
  final String bannerImg;
  final String subtitle;
  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(bannerImg),
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: SizedBox(
            height: 185,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(data[index].img),
                              fit: BoxFit.cover,
                              height: 120,
                              width: 180,
                            ),
                          ),
                          Text(
                            data[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
