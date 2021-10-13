import 'package:contacts_01/task2_week2/database/database.dart';
import 'package:contacts_01/task2_week2/model/model.dart';
import 'package:contacts_01/task2_week2/screens/new_note.dart';
import 'package:flutter/material.dart';

class HomeNote extends StatefulWidget {


  @override
  _HomeNoteState createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {
  MyDatabase myDatabase =MyDatabase();
  var notes = [];

  Widget noteItem(NoteItem noteItem){
   return Padding(
     padding: const EdgeInsets.all(5),
     child: Card(
       child: InkWell(
         onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewNotePage()));
         },
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               Expanded(
                 child: CheckboxListTile(
                   value:false,
                    onChanged: (val){
                       if(val == true){
                         myDatabase.delete(noteItem.id!);
                         myDatabase.getAll().then((value) {
                           setState(() {
                             notes =value;

                           });
                         });

                       }


                    },
                    controlAffinity: ListTileControlAffinity.leading,
                 ),
               ),
               Expanded(child: Text(noteItem.content! ,overflow: TextOverflow.ellipsis)),
               Expanded(child: Container()),
               // IconButton(onPressed: ()=>removeNote(noteItem), icon: Icon(Icons.remove_circle_outline)),

             ],
           ),
         ),
       ),
     ),
   );
  }
  Widget buildNote(){

    return ListView.builder(itemBuilder: (context ,index){
      var notesList = NoteItem.fromMap(notes[index]);

        return noteItem(notesList);


    },itemCount: notes.length,);
  }


  @override
  Widget build(BuildContext context) {
    myDatabase.getAll().then((value) {
      setState(() {
        notes =value;

      });
    });

    return Scaffold(
      appBar: AppBar( title:Text('ToDo'), centerTitle: true,),
      body: buildNote(),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewNotePage())),
        child: Icon(Icons.add),
      ),
    );
  }
}
