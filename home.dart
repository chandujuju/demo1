import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/model/usermodel.dart';
import 'package:untitled/screens/second.dart';
import 'package:untitled/services/api.dart';

class Home extends StatefulWidget{
  const Home({Key? key}): super(key:key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  List<UserModel> _UserModel = [];
  final _nameController = TextEditingController();

  @override
  void initState(){
    super.initState();
    getData();

  }

  void getData() async {
    _UserModel = (await Api().getUsers())!;

  }
  String Name="User Details";
  int _selectedIndex = 1;
  void _onTap(int index)
  {


    if(index == 0){
      print('first page!');
    }else if(index == 1){
      print('second page!');
    }else{

      print('third page!');




    }
    _selectedIndex = index;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    print(_selectedIndex.toString());
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  Text(Name),
      ),
      backgroundColor: Colors.grey,
      floatingActionButton:  FloatingActionButton(
          elevation: 0.0,
          backgroundColor:  Color(0xFFE57373),
          onPressed: (){
            print("HELLO");

          },
          child:  const Icon(Icons.check)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Color(0xFFF05236),),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,color: Color(0xFFF05236),),
            label: 'Add New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Color(0xFFF05236),),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),

      body:SafeArea(
          child:Column(
            children: [
              Row(
                children: const [
                  Text("hai",style: TextStyle(color: Colors.black,fontSize: 25),textAlign: TextAlign.left,),
                  SizedBox(width: 20,),
                  Text("hello",style: TextStyle(color: Colors.black,fontSize: 25),textAlign: TextAlign.left,),
                ],
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color:Colors.white

                ),
                child: TextFormField(
                  controller: _nameController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  validator: (value) => value!.isEmpty
                      ? 'Name cannot be blank'
                      : null,
                  decoration: InputDecoration(
                      prefix: Icon(Icons.search),
                      border: InputBorder.none,
                      hintStyle:
                      TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Name"),
                ),
              ),
               Card(
                elevation: 8,
                shadowColor: Colors.black,
                child: ListTile(
                  title: Text("Codesinsider.com"),
                  subtitle: Text("aravind"),
                  leading: const Icon(
                    Icons.audiotrack,
                    size: 50.0,
                    color: Colors.green,
                  ),
                  trailing:GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    child: const Icon(
                    Icons.arrow_forward,
                    size: 50.0,
                    color: Colors.green,
                  ),
                  ),
                ),
              ),
                ElevatedButton(
                onPressed: (){
                  Fluttertoast.showToast(msg: "toast example");

                }, child: null,
              ),
              Expanded(

                child:    ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text("List item $index"));
                    }),

              )


            ],
          )
      ),
    );

  }

}