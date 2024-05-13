import 'package:cki/views/transport/transport_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class TransportView extends StatelessWidget {
  const TransportView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransportViewModel>.reactive(
        viewModelBuilder: ()=> TransportViewModel(),
        builder: (context,model,child){
          return const Scaffold(
            body: Center(
              child: Text("Transport"),
            ),
          );
        });
  }
}
