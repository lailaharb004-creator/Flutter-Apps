import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_crud_operations/controller/posts_controller.dart';
import 'package:rest_api_crud_operations/view/posts_edit.dart';
import 'package:rest_api_crud_operations/view/posts_manager.dart';


class PostDetail  extends StatelessWidget{
  final int postIndex;
  const PostDetail({super.key, required this.postIndex});

  @override
  Widget build(BuildContext context) {
    var x=context.watch<PostsController>();
    return Scaffold(
      appBar: AppBar(
        actionsPadding: .symmetric(horizontal:  10),
        title: Text("Post Details",style: TextStyle(fontSize: 30, fontWeight: .bold),),
        actions: [
          Container(
            padding: .symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: .circular(8)
              
            ),
            child: Text("GET", style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: .bold)),
          )
        ],
      ),
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              padding: .all(20),
              width: 380,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: .circular(20),
        
              ),
              child: Row(
                spacing: 10,
                children: [
                  Container(
                    
                    width:50,height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: .circular(50)
                    ),
                    child: Align(alignment: .center,child: Text("${context.read<PostsController>().indexOf(postIndex)+1}", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: .bold),)),
                  ),
                  Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Text("POST #${context.read<PostsController>().indexOf(postIndex)+1}", style: TextStyle(color: const Color.fromARGB(255, 122, 118, 118)),),
                      SizedBox(width: 250,child: Text(x.postsList[postIndex].title,softWrap: true,style: TextStyle(fontSize: 20, fontWeight: .bold),))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(width: 380,child: Text("POST BODY", style: TextStyle(fontWeight: 
            .bold),)),
            Container(
              padding:.all(20),
              width: 380,
              decoration: BoxDecoration(
                color:Colors.grey[200],
                borderRadius: .circular(20)
              ),
              child:SizedBox(width: 250,child: Text(softWrap: true,style:TextStyle(fontSize: 20),x.postsList[postIndex].body)),
            ),
            SizedBox(height: 50,),
            InkWell(
              child: Container(
                width: 300,
                padding: .all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: .circular(50)
                ),
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: .center,
                  children: [
                    Icon(Icons.edit, color: Colors.white,),
                    Text("Edit Post" ,style:TextStyle(fontSize: 20,fontWeight: .bold, color:Colors.white),)
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => PostsEdit(postIndex: postIndex),));
              },
            ),
            SizedBox(height: 50,),
            InkWell(
              child: Container(
                width: 300,
                padding: .all(20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: .circular(50)
                ),
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: .center,
                  children: [
                    Icon(Icons.delete, color: Colors.white,),
                    Text("Delete Post" ,style:TextStyle(fontSize: 20,fontWeight: .bold, color:Colors.white),)
                  ],
                ),
              ),
              onTap: () async{
                  bool result=await context.read<PostsController>().deleteConfirm(context);
                  if(result){
                    context.read<PostsController>().deletePost(postIndex);
                    }
                Navigator.of(context).pop();
                
              },
            )
          ],
        ),
      )
    );

  }
  
}