import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemAudio extends StatelessWidget {
  ItemAudio({
    Key? key,
    required this.image,
    required this.name,
    required this.artist,
    required this.album,
    this.onTap,
  }) : super(key: key);

  String image, name, artist, album;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(
                height: 80,
                width: 160,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tên: $name",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Nghệ sĩ: $artist",
                  style: const TextStyle(fontSize: 15),
                ),
                album != ""
                    ? Text(
                        "Album: $album",
                        style: const TextStyle(fontSize: 15),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
