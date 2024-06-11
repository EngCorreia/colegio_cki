import 'package:cki/views/request_atl/request_atl_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../project/layers/core/configuration/configuration.dart';


class RequestAtlView extends StatefulWidget {

  const RequestAtlView({super.key});

  @override
  State<RequestAtlView> createState() => _RequestAtlViewState();
}

class _RequestAtlViewState extends State<RequestAtlView> {
  var value;
  @override
  Widget build(BuildContext context) {
    buildSheet(RequestAtlViewViewModel model) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              height: 48,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 15,
                        offset: const Offset(0.0, 0.0))
                  ]),
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: value,
                borderRadius: BorderRadius.circular(15),
                onChanged: (data) {
                  setState(() {
                    value = data;
                  });
                },
                hint: const Text("Adicionar alunos",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                items: List.generate(model.atl.length, (index) {
                  var e = model.atl[index];
                  return DropdownMenuItem(
                    value: e,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width - 50,
                          child: Text(e.toString(),
                              style: const TextStyle(fontSize: 14))),
                    ),
                  );
                }),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null) {
                    return "Texto invalido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                      left: 8, right: 8, top: 12, bottom: 12),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x4DFFFFFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 3,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(right: 0,left: 0,
                    bottom: 0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: _textEditingController,
                  decoration: const InputDecoration(
                    //icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    //prefixIcon: const Icon(Icons.person), // Add prefix icon
                    hintText: "Nome do aluno",
                    labelText: "Nome do aluno",
                    // errorText: createContactUser.validateName,
                  ),

                  onChanged: (value) {
                   // widget.teachersEntity.name = value;
                  },
                  cursorColor: Colors.indigo,
                  // validator: createContactUser.validateSalutation,
                ),
              ),
            ),
          ),
          const Divider(),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             GestureDetector(
               onTap: () async {
              Navigator.pop(context);
               },
               child: Container(
                 height: 40,
                 width: 150,
                 decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(25),
                   boxShadow: const [
                     BoxShadow(
                       color: Colors.white,
                       blurRadius: 1,
                       spreadRadius: 1,
                       // offset: const Offset(2, 2),
                     ),
                   ],
                 ),
                 child: Center(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10, right: 10),
                     child: Text(
                       " Cancelar ",
                       style: TextStyle(
                           fontFamily: SettingsCki.segoeEui,
                           fontWeight: FontWeight.normal,
                           color: Colors.white,
                           fontSize: 12),
                     ),
                   ),
                 ),
               ),

             ),
             GestureDetector(
               onTap: () async {
               },
               child: Container(
                 height: 40,
                 width: 150,
                 decoration: BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.circular(25),
                   boxShadow: const [
                     BoxShadow(
                       color: Colors.white,
                       blurRadius: 1,
                       spreadRadius: 1,
                       // offset: const Offset(2, 2),
                     ),
                   ],
                 ),
                 child: Center(
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10, right: 10),
                     child: Text(
                       " Adicionar ",
                       style: TextStyle(
                           fontFamily: SettingsCki.segoeEui,
                           fontWeight: FontWeight.normal,
                           color: Colors.white,
                           fontSize: 12),
                     ),
                   ),
                 ),
               ),

             ),
           ],
         ),
          const Divider(),
        ],
      );
    }
    return ViewModelBuilder<RequestAtlViewViewModel>.reactive(
        viewModelBuilder: ()=> RequestAtlViewViewModel(),
        builder: (context,model,child){
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.orange]),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20.0, top: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Text("Reservar agora",
                                  style: TextStyle(
                                    fontFamily: SettingsCki.segoeEui,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                  },
                                  child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.blue[900],
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            // offset: const Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                          child: Text(
                                            " Gravar Registo ",
                                            style: TextStyle(
                                                fontFamily: SettingsCki.segoeEui,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
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
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF00B686),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(.1),
                                          blurRadius: 8,
                                          spreadRadius: 3)
                                    ],
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    child: Image.asset(model.secondLogo),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text("Localização: Via expressa sentido Benfica Interior da Vila Nzoji yami,Rua 3",
                                    style: TextStyle(
                                        fontFamily: SettingsCki.segoeEui,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 210,left: 8,right: 8),
                  child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow:  [
                            BoxShadow(
                              color: Colors.black54.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                              // offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Alunos (0)",
                                  style: TextStyle(
                                      fontFamily: SettingsCki.segoeEui,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16),
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                 color: Colors.grey,
                                ),

                              InkWell(
                                onTap: ()=> showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    builder: (context) => buildSheet(model)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 15),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.add,color: Colors.blueAccent,),
                                      const SizedBox(width: 10,),
                                      Text("Adicionar mais",style: TextStyle(
                                       fontFamily: SettingsCki.segoeEui,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.black,
                                       fontSize: 15))
                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                        )

                      ),
                     /* GestureDetector(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              builder: (context) => buildSheet());
                        },
                        child:

                      ),
                      */

                )


              ],
            ),
          );
        });
  }
}
