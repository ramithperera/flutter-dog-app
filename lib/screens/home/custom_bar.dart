import 'package:dog_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: kBackgroundColor,
                    ),
                  ))
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(15),
              height: 150,
              width: 150,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(-1, 10),
                  blurRadius: 10,
                )
              ]),
              child: const Image(
                  image: const AssetImage('images/dog_pic.png'),
                  fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
