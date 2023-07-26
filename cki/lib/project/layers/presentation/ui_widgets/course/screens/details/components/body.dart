import 'package:flutter/material.dart';


import '../../../../../../domain/entities/courses_entity/coures_entitiy.dart';
import '../../../constants.dart';
import '../../../models/product.dart';
import 'chat_and_add_to_cart.dart';
import 'list_of_colors.dart';
import 'product_image.dart';

class BodyDetailCourse extends StatelessWidget {
  final Course coures;
  const BodyDetailCourse({Key? key, required this.coures}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${coures.id}',
                      child: ProductPoster(
                        size: size,
                        image:coures.images!,
                      ),
                    ),
                  ),
                  const ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(coures.classeName!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    '${coures.prices} Kzs Inscrição',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    child: Text(coures.description!,
                      style: const TextStyle(color: kTextLightColor),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            NewStudentButton(studentClass: coures.classeName!),
          ],
        ),
      ),
    );
  }
}
