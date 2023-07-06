import 'dart:developer';
import 'dart:io';
import 'package:cki/project/layers/presentation/ui_widgets/nova_matricula/read_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import '../../../core/configuration/configuration.dart';


class NovaMatricula extends StatefulWidget {
  const NovaMatricula({Key? key}) : super(key: key);

  @override
  State<NovaMatricula> createState() => _NovaMatriculaState();
}

class _NovaMatriculaState extends State<NovaMatricula> {

  DateTime dateTime = DateTime.now();
  final _textEditingController = TextEditingController();
  List<PlatformFile>? filesList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Colégio Kalabo Internacional",style: TextStyle(
            color: Colors.black,
            fontFamily: SettingsCki.segoeEui,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 4,),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Formulário de Admissão",style: TextStyle(
                    color: Colors.orange,
                    fontFamily: SettingsCki.segoeEui,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Nome do Aluno',
                  labelText: 'Nome do Aluno',
                  prefixIcon: Icon(Icons.person),
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Telefone',
                  labelText: 'Telefone',
                  prefixIcon: Icon(Icons.call),

                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  //icon: Icon(Icons.person),
                  border: const OutlineInputBorder(),
                  //prefixIcon: const Icon(Icons.person), // Add prefix icon
                  suffixIcon: IconButton(onPressed: (){
                    _showDate();
                  },
                  icon: const Icon(Icons.calendar_month),),
                  hintText: dateTime.toString(),
                  labelText: "Data de nascimento",
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Endereço',
                  labelText: 'Endereço',
                    prefixIcon: Icon(Icons.add_home_work_outlined)
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Nome do Pai',
                  labelText: 'Nome do Pai',
                  //prefixIcon: const Icon(Icons.person),
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  //icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Nome da mãe',
                  labelText: 'Nome da mãe',
                  // errorText: createContactUser.validateName,
                ),

                onChanged: (value) {

                },
                cursorColor: Colors.indigo,
                // validator: createContactUser.validateSalutation,
              ),
            ),

           /* ElevatedButton(
                onPressed: () async{
                  final result = FilePicker.platform.pickFiles();
                  //if(result == false) return;
                  // Open file
                  final file = result.then((value) => value?.files.first);

                  openFile(file);
                  final newFile = await saveFie(file);
                },
                child: Text("Anexo imagens")
            ),

            */


             Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                  child: Text("Por favor anexa uma cópia da declaração",style: TextStyle(
                    fontFamily: SettingsCki.segoeEui,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),)
              ),
            ),

              Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Por favor anexa a cópia da cedula ou B.I",style: TextStyle(
                      fontFamily: SettingsCki.segoeEui,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ),

             Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
              child: Row(
                children: [
                  IconButton(onPressed: () async {
                    final result = FilePicker.platform.pickFiles( allowMultiple: true,
                        type: FileType.custom,
                        allowedExtensions: ["pdf","png","jpg"]);
                    if(result == false) return;
                    await result.then((value){
                      setState(() {
                        filesList = value?.files;
                      });
                    });
                  },
                      icon: Image.asset("assets/images/attached.png")),
                  Text("Anexos")
                ],
              ),
            ),


            (filesList?.length != 0) ? Container(
              height: 160,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    mainAxisExtent: 150),
                itemBuilder: (_, index) {
                  var files = filesList![index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: 70,
                      height: 1900,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 1,
                            )
                          ]),
                      child: Column(
                        children: [
                          // grid_images(index),
                          buildFile(files),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: filesList!.length,
              ),
            ):Container(),

            const SizedBox(
              height: 20,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0,left: 10,right: 20,bottom: 5),
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),

                      ),
                      child: Center(
                        child: Text("Cancelar",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0,left: 0,right: 10,bottom: 5),
                    child: Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text("Gravar",style: TextStyle(
                            fontFamily: SettingsCki.segoeEui,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }

  _showDate(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((value){
      setState(() {
        dateTime = value!;
        _textEditingController.text = value.toString();
      });
    });
  }

   openFile(Future<PlatformFile?> file) {
    var path;
    file.then((value) => path = value?.path);
    OpenFile.open(path!);
  }

  Future<File> saveFie(Future<PlatformFile?> file) async{
    var name;
    var path;
    file.then((value){
      name = value?.name;
      path = value?.path;
    });
    final storage = await getApplicationDocumentsDirectory();
    final newFile = File("${storage.path}/$name");
    return File(path).copy(newFile.path);
  }

  void openFiles(List<PlatformFile> file) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FilesPage(
      files: file,
     // onOpenedFile: openFile,
    )));
  }

  Widget buildFile(PlatformFile file){
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    final extension = file.extension ?? 'none';
    //final color = getColor(extension);
    return InkWell(
      onTap: (){
        OpenFile.open(file.path);
      },
      child: SizedBox(
          child: Padding(
            padding:
            const EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width,
                    child: CircleAvatar(
                      radius: 35,
                      child: Image.asset("assets/images/folder.png"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(file.extension.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: SettingsCki.segoeEui,
                            fontSize: 12)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(file.name.toString(),
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          )),
    );
  }

}
