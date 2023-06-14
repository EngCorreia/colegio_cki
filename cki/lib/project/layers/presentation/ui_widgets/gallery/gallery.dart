import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Container(
          height: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 3,right: 8,top: 5,bottom: 5),
            child: TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                border: InputBorder.none,
                //hintText: 'Pesquisar',
                labelText: 'Pesquisar',
                prefixIcon: Icon(Icons.search_rounded),
                // errorText: createContactUser.validateName,
              ),
              onChanged: (value) {
              },
              cursorColor: Colors.indigo,
              // validator: createContactUser.validateSalutation,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/graduate.png"),
            ),
          )
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Galeria de fotos"),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: StaggeredGridView.countBuilder(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemCount: gelleryList.length,
                      itemBuilder: (context,index){
                        return gallery(index);
                      },
                      staggeredTileBuilder: (index){
                        return StaggeredTile.count(1, index.isEven? 1.2 : 1.5);
                      })
              ))
            ],
          ),
        ),
      ),
    );
  }

  List<String> gelleryList = [
    "assets/images/geleria1.png",
    "assets/images/galeria3.png",
    "assets/images/geleria4.png",
    //"assets/images/galeria5.png",
    //"assets/images/geleria7.png",
    "assets/images/geleria8.png",
    "assets/images/geleria9.png",
   // "assets/images/geleria7.png",
  ];


  gallery(int index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 1,
            spreadRadius: 1,
            // offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Image.asset(gelleryList[index],fit: BoxFit.cover,),
    );
  }
}
