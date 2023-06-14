import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../../core/configuration/configuration.dart';

class FilesPage extends StatefulWidget {

  final List<PlatformFile> files;
  //final ValueChanged<PlatformFile> onOpenedFile;

  const FilesPage({Key? key, required this.files,}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            mainAxisExtent: 150),
        itemBuilder: (_, index) {
          var files = widget.files[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 50,
              height: 200,
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
        itemCount: widget.files.length,
      ),
    );
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
                  Text("Matemática",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: SettingsCki.segoeEui,
                        fontSize: 12),
                  ),

                  Text("1º e 2º classe",
                    style: TextStyle(
                        color: Colors.black54,
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
