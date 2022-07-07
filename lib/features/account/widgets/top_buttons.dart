import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your Orders",
              press: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              press: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: "Your Wish List",
              press: () {},
            ),
            AccountButton(
              text: "Log Out",
              press: () => AccountServices().logOut(context),
            ),
          ],
        ),
      ],
    );
  }
}
