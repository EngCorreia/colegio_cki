
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import '../../../project/layers/presentation/ui_widgets/calendary_screen/widgets/assignment_widgets.dart';
import '../../../project/layers/presentation/ui_widgets/datesheet_screen/data/constList.dart';
import 'listagem_turma_view_model.dart';



class ListClassView extends StatelessWidget {

  const ListClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListClassViewModel>.reactive(
        viewModelBuilder: ()=> ListClassViewModel(),
        builder: (context,model,child){
          final formKey = GlobalKey<FormState>();
          final note1 = useTextEditingController();
          final note2 = useTextEditingController();
          final note3 = useTextEditingController();
          return Scaffold(
            body: SingleChildScrollView(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding),
                      color: kOtherColor,
                      boxShadow: const [
                        BoxShadow(
                          color: kTextLightColor,
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.4),
                            borderRadius:
                            BorderRadius.circular(kDefaultPadding),
                          ),
                          child: Center(
                            child: Text(
                              "Lingua Portuguesa",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        kHalfSizedBox,
                        //then show button
                          AssignmentButton(
                            onPress: () {
                              //submit here
                            },
                            title: 'Anexar nota',
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          );
        });
  }


}
