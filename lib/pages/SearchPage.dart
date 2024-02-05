import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  
  SearchPage({super.key});

  TextEditingController _controller = TextEditingController();
  String recherche ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getArtiste(recherche),
        builder: (context, snapshot){
        if(snapshot.hasData)
        {
          if(snapshot.data=="")
         return Container();
         else 
         return Text("Nomm album");
        }
        else 
        {
          return CircularProgressIndicator();

        }
      },),

      /*
      HomePageBar: HomePageBar(
        title: Text("Music"),
        backgroundColor: Colors.cyan,
      ),
      */

      floatingActionButton: FloatingActionButton(onPressed: (){
          showDialog(context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Please insert the artist name"),
              content: TextField(
                controller: _controller,
              ),
              actions: [
              ElevatedButton(
                
                onPressed: (){
                  recherche =   _controller.text;
                  
                  Navigator.pop(context);
                  

              }, child: Text("Valider")),

               ElevatedButton(
                
                onPressed: (){
                  Navigator.pop(context);

              }, child: Text("Annuler"))
              
              ],
             
            );

          });
      },
      child: Icon(Icons.search),
      ),

    );
  }

  Future<dynamic> getArtiste(String user_Artiste)async {

    

    if(recherche==""){
      return "";

    }
    else {
      // httppp
    }
  }
}