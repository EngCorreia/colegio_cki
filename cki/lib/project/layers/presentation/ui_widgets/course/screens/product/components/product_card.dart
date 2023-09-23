import 'package:flutter/material.dart';
import '../../../../../../domain/entities/courses_entity/coures_entitiy.dart';
import '../../../constants.dart';
import '../../details/details_screen.dart';

class CoursesCard extends StatefulWidget {
  final int itemIndex;
  final Course coures;

  const CoursesCard({
    Key? key, required this.itemIndex,required this.coures}) : super(key: key);

  @override
  State<CoursesCard> createState() => _CoursesCardState();
}

class _CoursesCardState extends State<CoursesCard> {


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsCourses(coures: widget.coures,))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: widget.itemIndex.isEven ? kBlueColor : kSecondaryColor,
                boxShadow: const [kDefaultShadow],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: '${widget.coures.id}',
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 160,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 200,
                  child: Image.asset(widget.coures.images!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Product title and price
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text("${widget.coures.classeName} Colegio Kalabo Internacional",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use the available space
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5, // 30 padding
                        vertical: kDefaultPadding / 4, // 5 top and bottom
                      ),
                      decoration: const BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text("\$${widget.coures.prices}",
                          style: Theme.of(context).textTheme.button,
                        ),

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
