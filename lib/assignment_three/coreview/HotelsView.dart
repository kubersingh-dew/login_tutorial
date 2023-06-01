import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../datamodel/Data.dart';


class HotelsView extends StatelessWidget {
  const HotelsView({super.key, required this.title, required this.data});

  final List<Data> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (_, index) => HotelItem(
                data: data[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelItem extends StatelessWidget {
  const HotelItem({super.key, required this.data});

  final Data data;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.75,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)), // THIS NOT APPLYING !!!
        elevation: 6,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(data.img),
              fit: BoxFit.cover,
              height: 200,
              width: width * 0.75,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      data.subTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 18,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.blue,
                          size: 16,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "4.6",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "1.5 Kilometer away",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "\$25 night",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
