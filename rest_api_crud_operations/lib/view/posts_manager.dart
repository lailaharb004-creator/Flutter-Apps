import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_crud_operations/controller/posts_controller.dart';
import 'package:rest_api_crud_operations/view/post_detail.dart';
import 'package:rest_api_crud_operations/view/posts_create.dart';
import 'package:rest_api_crud_operations/view/posts_edit.dart';


class PostsManager  extends StatefulWidget{
  
  const PostsManager({super.key, });

  @override
  State<PostsManager> createState() => _PostsManagerState();
}

class _PostsManagerState extends State<PostsManager> {

  @override
  void initState() {
    super.initState();
    context.read<PostsController>().getData();
  }
  @override
  Widget build(BuildContext context) {
    var x =context.watch<PostsController>();
    return Scaffold(
        appBar: AppBar(
        actionsPadding: .symmetric(horizontal:  10),
        title: Text("Posts Manager",style: TextStyle(fontSize: 30, fontWeight: .bold),),
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
        body:x.returnedList.isEmpty? Center(
          child: Column(
            children: [
              SizedBox(width: 380,child: Text("Manage your posts", style: TextStyle(fontWeight: .bold, fontSize: 18),)),
              SizedBox(height: 8,),
              Container(
                width: 380,
                padding: .all(5),
                decoration: BoxDecoration(
                  borderRadius: .circular(20), 
                  color: Colors.grey[300]),
                  child: Text("https://jsonplaceholder.typicode.com/posts",style: TextStyle(fontWeight: .bold ,fontSize: 18))
                  ),
              SizedBox(height: 10,),
              SizedBox(
                width: 380,
                child: TextField(
                  controller:  x.searchCtr,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: .circular(50)),
                  hintText: "Search posts...",
                  suffixIcon: IconButton(onPressed: (){
                    context.read<PostsController>().search();
                  }, icon: Icon(Icons.search))
                ),),
              ),
              SizedBox(height: 20,),
              MaterialButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostsCreate()),);
              },
              minWidth: 380,
              padding: .all(20),
              shape: RoundedRectangleBorder(borderRadius: .circular(50)),color: Colors.deepPurple,
              child: Text("+  Add Post", style: TextStyle(fontSize: 18, color: Colors.white70),),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder:(context, index) =>InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => PostDetail(postIndex: index),));
                      },
                      child: Container(
                      padding: .all(20),
                      width: 380,
                      // height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: .circular(20)
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          
                          Row(
                            mainAxisAlignment: .spaceAround,
                            spacing: 10,
                            children: [
                              SizedBox(width:200,child: Text("POST #${index+1}", style: TextStyle(fontSize: 20,fontWeight: .bold),)),
                              Row(
                                spacing: 5,
                                children: [
                                  Container(decoration: BoxDecoration(color: Colors.grey,borderRadius:.circular(10)),child: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) =>PostsEdit(postIndex: index,)));}, icon:Icon(Icons.edit , color: Colors.black,))),
                                  Container(decoration: BoxDecoration(color: Colors.red,borderRadius:.circular(10)),child: IconButton(
                                    onPressed: ()async{
                                      bool result=await context.read<PostsController>().deleteConfirm(context);
                                      if(result){
                                        context.read<PostsController>().deletePost(index);

                                      }
                                  
                                  }, icon:Icon(Icons.delete, color: Colors.white,))),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: .spaceAround,
                            crossAxisAlignment: .start,
                            children: [
                              Container(
                                width:50, height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: .circular(50)
                                ),
                                child: Center(child: Text("${index+1}", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: .bold),)),
                                ),
                              Column(
                                children: [
                                  SizedBox(width: 200,child: Text(x.postsList[index].title,overflow: .ellipsis, style: TextStyle(fontSize: 20 , fontWeight: .bold),)),
                                  SizedBox(width: 200,child: Text(x.postsList[index].body,overflow: .ellipsis,))
                                ],
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                                        ),
                    ) ,
                    separatorBuilder:(context, index) => SizedBox(height: 10,), 
                    itemCount:x.postsList.length),
                ),
              ),
              
          
            ],
          ),
        )
      :
      Center(
          child: Column(
            children: [
              SizedBox(width: 380,child: Text("Manage your posts", style: TextStyle(fontWeight: .bold, fontSize: 18),)),
              SizedBox(height: 8,),
              Container(
                width: 380,
                padding: .all(5),
                decoration: BoxDecoration(
                  borderRadius: .circular(20), 
                  color: Colors.grey[300]),
                  child: Text("https://jsonplaceholder.typicode.com/posts",style: TextStyle(fontWeight: .bold ,fontSize: 18))
                  ),
              SizedBox(height: 10,),
              SizedBox(
                width: 380,
                child: TextField(
                  controller:  x.searchCtr,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: .circular(50)),
                  hintText: "Search posts...",
                  suffixIcon: IconButton(onPressed: (){
                    context.read<PostsController>().search();
                  

                  }, icon: Icon(Icons.search))
                ),),
              ),
              SizedBox(height: 20,),
              MaterialButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostsCreate()),);
              },
              minWidth: 380,
              padding: .all(20),
              shape: RoundedRectangleBorder(borderRadius: .circular(50)),color: Colors.deepPurple,
              child: Text("+  Add Post", style: TextStyle(fontSize: 18, color: Colors.white70),),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder:(context, index) =>InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => PostDetail(postIndex: index),));
                      },
                      child: Container(
                      padding: .all(20),
                      width: 380,
                      // height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: .circular(20)
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          
                          Row(
                            mainAxisAlignment: .spaceAround,
                            spacing: 10,
                            children: [
                              SizedBox(width:200,child: Text("POST #${context.read<PostsController>().indexOf(index)+1}", style: TextStyle(fontSize: 20,fontWeight: .bold),)),
                              Row(
                                spacing: 5,
                                children: [
                                  Container(decoration: BoxDecoration(color: Colors.grey,borderRadius:.circular(10)),child: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder:(context) => PostsEdit(postIndex: index)));}, icon:Icon(Icons.edit , color: Colors.black,))),
                                  Container(decoration: BoxDecoration(color: Colors.red,borderRadius:.circular(10)),child: IconButton(
                                    onPressed: ()async{
                                      bool result=await context.read<PostsController>().deleteConfirm(context);
                                      if(result){
                                        context.read<PostsController>().deletePost(index);

                                      }
                                    }, icon:Icon(Icons.delete, color: Colors.white,))),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: .spaceAround,
                            crossAxisAlignment: .start,
                            children: [
                              Container(
                                width:50, height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: .circular(50)
                                ),
                                child: Center(child: Text("${context.read<PostsController>().indexOf(index)+1}", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: .bold),)),
                                ),
                              Column(
                                children: [
                                  SizedBox(width: 200,child: Text(x.postsList[index].title,overflow: .ellipsis, style: TextStyle(fontSize: 20 , fontWeight: .bold),)),
                                  SizedBox(width: 200,child: Text(x.postsList[index].body,overflow: .ellipsis,))
                                ],
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                    ) ,
                    separatorBuilder:(context, index) => SizedBox(height: 10,), 
                    itemCount:x.postsList.length),
                ),
              ),
              
          
            ],
          ),
        ),
      
    );
  }
}