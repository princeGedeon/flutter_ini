


import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key,required String this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController nom_controller;
  late TextEditingController prenom_controller;
  late TextEditingController bio_controller;

  late TextEditingController age_controller;
  var formkey=GlobalKey<FormState>();
  String description="";
  @override
  void initState(){
    nom_controller=TextEditingController();
    prenom_controller=TextEditingController();
    age_controller=TextEditingController();
    bio_controller=TextEditingController();
  }

  @override
  void dispose(){
    age_controller.dispose();
    nom_controller.dispose();
    prenom_controller.dispose();
    bio_controller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: size.height,
        width: size.width,

        child:
            Container(
                height: size.height*0.75,

              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  monForm(),
                  ElevatedButton(onPressed: (){
                    if (formkey.currentState!.validate()){
                      setState(() {
                        description="Je m'apelle "+nom_controller.text +" "+prenom_controller.text+"\n j'ai "+age_controller.text +" age"+"Et enfin ,"+ bio_controller.text;
                      });
                    }

                  }, child: Text("Update")),


                  Text(description)
                ],





            ),


        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { print("Prince"); },
        child: Icon(Icons.linked_camera),
      ),
    );
  }

  Widget monForm(){
    return Form(
      key: formkey,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(controller: nom_controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Nom",hintText: "Quel est votre nom",icon: Icon(Icons.edit)),
            validator: (String? nom){
            return (nom==null || nom=="")?"Champs Obligatoire":null;
            },
            
          ),
          TextFormField(controller: prenom_controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Prénom",hintText: "Quel est votre prénom",icon:Icon(Icons.edit_attributes)),
    validator: (String? prenom) {
      return (prenom == null || prenom == "") ? "Champs Obligatoire" : null;
    }
          ),
          TextFormField(controller: age_controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age",hintText: "Quel est votre age",icon: Icon(Icons.description)),
              validator: (String? age) {
                return (age == null || age == "") ? "Champs Obligatoire" : null;
              }

          ),
          TextFormField(controller: bio_controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Bio",hintText: "Quel est votre bio",icon: Icon(Icons.description)),
              validator: (String? bio) {
                return (bio == null || bio == "") ? "Champs Obligatoire" : null;
              }

          ),
          

        ],
      ),
    );
  }
}
