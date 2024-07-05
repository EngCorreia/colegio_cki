
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../project/layers/core/configuration/configuration.dart';
import '../request_atl/request_atl_view.dart';
import 'atl_view_model.dart';


class AtlView extends StatelessWidget {

  const AtlView({super.key});

  @override
  Widget build(BuildContext context) {
    buildSheet() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const RequestAtlView(
              )));
            },
            leading: ClipOval(
              child: Image.asset(
                "assets/images/colegio.png",
                width: 40,
                height: 40,
              ),
            ),
            title: Text(
              "Alunos internos",
              style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
            subtitle: Text(
              "35.000,00 kzs das 12h30 min às 18h00",
              style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const RequestAtlView(
              )));
            },
            leading: ClipOval(
              child:Image.asset(
                "assets/images/colegio.png",
                width: 40,
                height: 40,
              ),
            ),
            title: Text(
              "Alunos externos",
              style: TextStyle(
                  fontFamily: SettingsCki.segoeEui,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
            subtitle: Text(
              "40.000,00 kzs das 12h30 min às 18h00",
              style: TextStyle(
                fontFamily: SettingsCki.segoeEui,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const Divider(),
        ],
      );
    }
    return ViewModelBuilder<AtlViewModel>.reactive(
        viewModelBuilder: ()=> AtlViewModel(),
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
                                Text("SERVIÇO ATL",
                                  style: TextStyle(
                                    fontFamily: SettingsCki.segoeEui,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20))),
                                        builder: (context) => buildSheet());
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
                                            "INSCRIÇÕES ABERTAS",
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
                                  child: Text("Os nossos serviço de ATL para seu filho incluem:",
                                    style: TextStyle(
                                        fontFamily: SettingsCki.segoeEui,
                                        fontSize: 20,
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
                  padding: const EdgeInsets.only(top: 180,bottom: 10),
                  child: ListView.builder(
                    itemCount: model.atl.length,
                    itemBuilder: (context,index)=> Padding(
                      padding: const EdgeInsets.only(left: 2,top: 5,right: 40,bottom: 5),
                      child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3,
                              offset: const Offset(5, 5),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(50),
                          )),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(model.atl[index],style: const TextStyle(color: Colors.white),),
                      ),
                      ),
                    ),
                  ),
                )


              ],
            ),
          );
        });
  }


}
