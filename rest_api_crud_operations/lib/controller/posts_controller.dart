import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_crud_operations/model/posts_model.dart';
import 'package:http/http.dart' as http;
class PostsController extends ChangeNotifier{
  String errorMessage="";
  List<PostsModel> postsList =[];
  List<PostsModel> notChangedList=[];
  TextEditingController searchCtr=TextEditingController();
  int autoId=101;

  Future<void>getData()async{
    try{
      var response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if(response.statusCode ==200){
        List data=jsonDecode(response.body);
        postsList=data.map((entry)=>PostsModel.fromJson(entry)).toList();
      }
      else{
        errorMessage="ERROR : ${response.statusCode}";
      }
      
      
    }
    catch(e){
      errorMessage="Something Went Wrong !!";
    }
    notChangedList=postsList;
    
    notifyListeners();
  }
  /////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////
  TextEditingController createTitleCtr=TextEditingController();
  TextEditingController createBodyCtr=TextEditingController();
  String createRequiredMessage="";
  double createOpacity=0;
  Color createBorderColor=Colors.black26;

  Future<void>addData(BuildContext context)async {
    createOpacity=0;
    createBorderColor=Colors.black26;
    if(searchCtr.text.isNotEmpty){
      try{
      if(createTitleCtr.text.isNotEmpty && createBodyCtr.text.isNotEmpty){

        var response=await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts") ,
        body:jsonEncode({
          "title":createTitleCtr.text,
          "body":createBodyCtr.text,
          "userId":1
        }) ,
        headers: {"Content-Type":"application/json"}
        );
        if(response.statusCode==201){
          postsList.add(PostsModel.fromJson({
          "id":autoId++,
          "title":createTitleCtr.text,
          "body":createBodyCtr.text,
          "userId":1
        })
        );
          notChangedList.add(PostsModel.fromJson({
          "id":autoId++,
          "title":createTitleCtr.text,
          "body":createBodyCtr.text,
          "userId":1
        })
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("Post Created Sucessfully !"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          )
          );
      }
      else{
        errorMessage="ERROR:${response.statusCode}";
      }
      }

      else{
      
        createBorderColor=Colors.red;
        createRequiredMessage="Required";
        createOpacity=1;
      }
      
    }
    catch(e){
      errorMessage="Something Went Wrong";
    }
    }
    else{
      try{
      if(createTitleCtr.text.isNotEmpty && createBodyCtr.text.isNotEmpty){
        var response=await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts") ,
        body:jsonEncode({
          "title":createTitleCtr.text,
          "body":createBodyCtr.text,
          "userId":1
        }) ,
        headers: {"Content-Type":"application/json"}
        );
        if(response.statusCode==201){
          postsList.add(PostsModel.fromJson({
          "id":autoId++,
          "title":createTitleCtr.text,
          "body":createBodyCtr.text,
          "userId":1
        })
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("Post Created Sucessfully !"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          )
          );
      }
      else{
        errorMessage="ERROR:${response.statusCode}";
      }
      }

      else{
        createBorderColor=Colors.red;
        createRequiredMessage="Required";
        createOpacity=1;
      }
      
    }
    catch(e){
      errorMessage="Something Went Wrong";
    }
    }
    
    createTitleCtr.clear();
    createBodyCtr.clear();
    notifyListeners();
  }
  void creteReset(){
    createOpacity=0;
    createBorderColor=Colors.black26;
    createTitleCtr.clear();
    createBodyCtr.clear();
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////
  TextEditingController editTitleCtr=TextEditingController();
  TextEditingController editBodyCtr=TextEditingController();
  String editRequiredMessage="";
  double editOpacity=0;
  Color editBorderColor=Colors.black26;


  Future<void>editPost(BuildContext context,int index)async{
    final int id=postsList[index].id;
    editOpacity=0;
    editBorderColor=Colors.black26;
    if(searchCtr.text.isNotEmpty){
      try{
      if(editTitleCtr.text.isNotEmpty && editBodyCtr.text.isNotEmpty){
        var response=await http.put(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id") ,
        body:jsonEncode({
          "title":editTitleCtr.text,
          "body":editBodyCtr.text,
          "userId":1
        }) ,
        headers: {"Content-Type":"application/json"}
        );
        
        if(response.statusCode==200 || id>100){
          notChangedList[indexOf(index)]=PostsModel.fromJson({
          "id":id,
          "title":editTitleCtr.text,
          "body":editBodyCtr.text,
          "userId":1
        }
        );
          postsList[index]=PostsModel.fromJson({
          "id":id,
          "title":editTitleCtr.text,
          "body":editBodyCtr.text,
          "userId":1
        }
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("Post Edited Sucessfully !"),
          backgroundColor: Colors.amber,
          duration: Duration(seconds: 3),
          )
          );
      
      }
      else{
        errorMessage="ERROR:${response.statusCode}";
      }
      
      }

      else{
        editBorderColor=Colors.red;
        editRequiredMessage="Required";
        editOpacity=1;
      }
      
    }
    catch(e){
      errorMessage="Something Went Wrong";
    }
    }
    else{
      try{
      if(editTitleCtr.text.isNotEmpty && editBodyCtr.text.isNotEmpty){
        var response=await http.put(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id") ,
        body:jsonEncode({
          "title":editTitleCtr.text,
          "body":editBodyCtr.text,
          "userId":1
        }) ,
        headers: {"Content-Type":"application/json"}
        );
        if(response.statusCode==200 || id>100){
          postsList[index]=PostsModel.fromJson({
          "id":id,
          "title":editTitleCtr.text,
          "body":editBodyCtr.text,
          "userId":1
        }
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("Post Edited Sucessfully !"),
          backgroundColor: Colors.amber,
          duration: Duration(seconds: 3),
          )
          );
      }
      else{
        errorMessage="ERROR:${response.statusCode}";
      }
      
      }

      else{
        editBorderColor=Colors.red;
        editRequiredMessage="Required";
        editOpacity=1;
      }
      
    }
    catch(e){
      errorMessage="Something Went Wrong";
    }
    }

    editTitleCtr.clear();
    editBodyCtr.clear();
    notifyListeners();
  }
  void editReset(){
    editOpacity=0;
    editBorderColor=Colors.black26;
    editTitleCtr.clear();
    editBodyCtr.clear();
    notifyListeners();
  }
  ////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  Future<void> deletePost (int id)async {
    if(searchCtr.text.isNotEmpty){
      try{
      await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
      notChangedList.removeAt(indexOf(id));
      postsList.removeAt(id);
      
    }
    catch(e){
      errorMessage="Something Went Wrong";
      
    }
    }
    else{
      
      try{
      await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));
      postsList.removeAt(id);
      
      
    }
      catch(e){
        errorMessage="Something Went Wrong";
        
      }
    
    }
    
    
    notifyListeners();
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////
  List<PostsModel> returnedList=[];
  
  void search(){

    postsList=notChangedList;
    returnedList=[];
    if(searchCtr.text!=""){

      for(PostsModel post in postsList){
        if(post.title.contains(searchCtr.text)){
          returnedList.add(post);
        }
      }
      postsList=returnedList;
    }
    notifyListeners();
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////
  int indexOf (int index){
    int returnedIndex=0;
    for (int i=0 ; i<notChangedList.length;i++){
      if(notChangedList[i].id==postsList[index].id){
        returnedIndex=i;
        
      }
    }
    // notChangedList[i].title==postsList[index].title && notChangedList[i].body==postsList[index].body
    return returnedIndex;
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<bool> deleteConfirm(BuildContext context)async{
    return await showDialog(context: context, builder:(context) {
      return AlertDialog(
        icon: Icon(Icons.question_mark),
        iconColor: Colors.red,
        title: Text("Are You Sure", style: TextStyle(fontSize: 20, fontWeight: .bold, color: Colors.red),),
          
        content: Text("Do you really want to delete this task ? You will not be able to undo this action."),
        actions: [
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              MaterialButton(onPressed: (){
                Navigator.pop(context, false);
              },shape: RoundedRectangleBorder(borderRadius: .circular(10), side: BorderSide(color: Colors.red)),child: Text("NO", style: TextStyle(color: Colors.red),),),
              MaterialButton(onPressed: (){
                Navigator.pop(context, true);
              },color: Colors.red,shape: RoundedRectangleBorder(borderRadius: .circular(10), ),child: Text("YES", style:TextStyle(color: Colors.white),),)
            ],
          )
        ],
      );
    },);
  }
  
}
/*
import 'package:first/services/task_service.dart';
import 'package:first/view/login_page.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskService _taskService = TaskService();
  TextEditingController controller = TextEditingController();
  Authservice _authservice = Authservice();
  String selectedCountry = "Jordan";
  List<String> countries = ["Jordan", "KSA", "EGY", "Palestine"];
  Future<bool> showDeleteDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Task?"),
          content: const Text("Are u sure u want to delkete task?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context, true);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await _authservice.logout();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
            );
          },
          icon: Icon(Icons.logout),
        ),
        title: Text("My Tasks"),
        centerTitle: true,
      ),

      body: StreamBuilder(
        stream: _taskService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final tasks = snapshot.data;

          if (tasks == null) {
            return SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 20,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedCountry,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Country"),
                  ),
                  items: countries
                      .map(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Country"),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      _taskService.addTask(controller.text, context);
                      controller.clear();
                    }
                  },
                  child: Text("Save"),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: tasks[index].isDone,
                          onChanged: (value) {
                            _taskService.updateStatus(
                              tasks[index].id,
                              !tasks[index].isDone,
                            );
                          },
                        ),

                        title: Text(tasks[index].title),
                        trailing: IconButton(
                          onPressed: () async {
                            bool result = await showDeleteDialog(context);
                            if (result) {
                              await _taskService.deleteTask(tasks[index].id);
                            }
                          },
                          icon: Icon(Icons.remove),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/