
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'data/constList.dart';
import 'data/datesheet_data.dart';


class DateSheetScreen extends StatelessWidget {
  const DateSheetScreen({Key? key}) : super(key: key);
  static const String routeName = 'DateSheetScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateSheet'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView.builder(
          itemCount: dateSheet.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(
                  left: kDefaultPadding / 2, right: kDefaultPadding / 2),
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                  //first need a row, then 3 columns
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //1st column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dateSheet[index].date.toString(),
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                          Text(dateSheet[index].monthName,
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),

                      //2nd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dateSheet[index].subjectName,
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                          Text(dateSheet[index].dayName,
                              style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                      //3rd one
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '🕒${dateSheet[index].time}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
