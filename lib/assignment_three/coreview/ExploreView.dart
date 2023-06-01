import 'package:flutter/material.dart';
import 'package:login_tutorial/assignment_three/datamodel/Data.dart';
import 'package:transparent_image/transparent_image.dart';


class ExploreView extends StatelessWidget {
  const ExploreView({super.key, required this.data});

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                      data[index].img),
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
              ),
              Text(
                data[index].title,
                style: const TextStyle(
                    fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
