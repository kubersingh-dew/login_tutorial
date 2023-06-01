import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../datamodel/Data.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key, required this.data});

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(data[index].img),
                      fit: BoxFit.cover,
                      height: 180,
                      width: 120,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 4,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: NetworkImage(
                                data[index].contentImg??""),
                            fit: BoxFit.cover,
                            height: 180,
                            width: 120,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
