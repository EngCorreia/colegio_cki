import 'package:cki/views/transport/transport_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../project/layers/core/configuration/configuration.dart';
import '../request_atl/request_atl_view.dart';

class TransportView extends StatelessWidget {
  const TransportView({super.key});

  @override
  Widget build(BuildContext context) {
    var formatador;
    return ViewModelBuilder<TransportViewModel>.reactive(
        viewModelBuilder: ()=> TransportViewModel(),
        onViewModelReady: (model){
          model.initValue();
          var locale = 'pt_BR';
          // Crie uma instância de NumberFormat para moeda
          formatador = NumberFormat.currency(locale: locale, symbol: 'kzs');
        },
        builder: (context,model,child){
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                    children: [
                      Container(
                        height: 260,
                        decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                              spreadRadius: 2,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20.0, top: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Text("Solicitar transporte",
                                    style: TextStyle(
                                      fontFamily: SettingsCki.segoeEui,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    //width: 160.0,
                                    height: 160.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child:  Image.asset("assets/course/course5.png",fit: BoxFit.contain,),

                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Image.asset("assets/images/cki_images/bus-min.png",width: 150,height: 150,)
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Text("Número de filhos",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontSize: 20
                          ),)
                      ),

                      Container(
                        height: 45,
                        margin: const EdgeInsets.symmetric(horizontal: 80),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: ()=> model.setDecrementValue(),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle
                                ),
                                child: const Center(
                                  child: Text("-",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20
                                  )),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 50,left: 50),
                              child: Text("${model.qtd}",style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 20
                              ),),
                            ),
                            InkWell(
                              onTap: ()=> model.setAddValue(),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle
                                ),
                                child: const Center(
                                  child: Text("+",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Container(
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Preço do transporte: ",style: TextStyle(
                                        fontFamily: SettingsCki.segoeEui,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    )),
                                    Text("${formatador.format(model.prices)}",style: TextStyle(
                                        fontFamily: SettingsCki.segoeEui,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.blue
                                    ))
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Geral: ",style: TextStyle(
                                        fontFamily: SettingsCki.segoeEui,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    Text("${formatador.format(model.pricesTotal)}",style: TextStyle(
                                        fontFamily: SettingsCki.segoeEui,
                                        fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.blue
                                    ))
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(),
                              ),

                              Container(
                                width: 200,
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                ),
                                child: const Center(
                                  child: Text("Solicitar agora",style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ],
                  ),
            ),
          );
        });
  }


}
