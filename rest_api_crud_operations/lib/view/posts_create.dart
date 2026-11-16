import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_crud_operations/controller/posts_controller.dart';

class PostsCreate extends StatelessWidget{
  const PostsCreate({super.key});

  @override
  Widget build(BuildContext context) {
    var x=context.watch<PostsController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.read<PostsController>().creteReset();
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
        actionsPadding: .symmetric(horizontal:  10),
        title: Text("Create Post",style: TextStyle(fontSize: 30, fontWeight: .bold),),
        actions: [
          Container(
            padding: .symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: .circular(8)
              
            ),
            child: Text("POST", style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: .bold)),
          )
        ],
      ),
      body: Center(
        child: Column(
          spacing: 5,
          children: [
            SizedBox(height: 30,),
            SizedBox(width: 380,child: Text("Post Title", style: TextStyle(fontSize: 20,fontWeight: .bold),)),
            SizedBox(
              width: 380,
              child: TextField(
                controller: x.createTitleCtr,
                decoration: InputDecoration(
                
                hintText: "Enter post title...",
                enabledBorder: OutlineInputBorder(borderRadius: .circular(20), borderSide: BorderSide(color:x.createBorderColor)),
                focusedBorder: OutlineInputBorder(borderRadius: .circular(20), borderSide: BorderSide(color:Colors.black26)), 
              ),
              
              ),
              
              
            ),
            Opacity(opacity: x.createOpacity,child: SizedBox(width: 380,child: Text(x.createRequiredMessage, style: TextStyle(color: Colors.red, fontWeight: .bold),))),
            SizedBox(height: 10,),
            SizedBox(width: 380,child: Text("Post Body", style: TextStyle(fontSize: 20,fontWeight: .bold),)),
            SizedBox(
              width: 380,
              child: TextField(
                controller: x.createBodyCtr,
                maxLines: 8,
                decoration: InputDecoration(
                
                hintText: "Enter post body...",
                enabledBorder: OutlineInputBorder(borderRadius: .circular(20), borderSide: BorderSide(color:x.createBorderColor)),
                focusedBorder: OutlineInputBorder(borderRadius: .circular(20), borderSide: BorderSide(color:Colors.black26)), 
              ),),
            ),
            Opacity(opacity: x.createOpacity,child: SizedBox(width: 380,child: Text(x.createRequiredMessage , style: TextStyle(color: Colors.red, fontWeight: .bold)))),
            SizedBox(height: 50,),

            MaterialButton(onPressed: (){
              context.read<PostsController>().addData(context);
            
            },
            padding: .all(15),
              shape: RoundedRectangleBorder(borderRadius: .circular(50)),
              minWidth: 380,
              color: Colors.deepPurple,
              child: Text("Create Post", 
              style: TextStyle(fontSize: 18, color: Colors.white)
              ),
              ),
            TextButton(onPressed: (){
              context.read<PostsController>().creteReset();
              
            }
            ,child:Text("Cancel",style: TextStyle(fontSize: 18, fontWeight: .bold)))
          ],
        ),
      ),
    );
  }
  
}