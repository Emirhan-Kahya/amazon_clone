import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Image.network(
          'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
          height: 220,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text(
            'Test'.replaceAll('', '\u200B'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network('https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg', fit: BoxFit.fitWidth, width: 100, height: 100,),
            Image.network('https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg', fit: BoxFit.fitWidth, width: 100, height: 100,),
            Image.network('https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg', fit: BoxFit.fitWidth, width: 100, height: 100,),
            Image.network('https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg', fit: BoxFit.fitWidth, width: 100, height: 100,),
          ],
        ),
      ],
    );
  }
}