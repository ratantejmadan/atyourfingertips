import 'package:atyourfingertips/service/client_sdk_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:atyourfingertips/screens/onboarding.dart';

AllToDoLists allToDoLists = AllToDoLists();
AllMembers allMembers = AllMembers([]);


class MainMenu extends StatefulWidget {
  final String text;
  MainMenu({Key key, @required this.text}) : super(key: key);
  static final String id = 'second';
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '@Your Fingertips',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MainPage(title: 'Home'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title,}) : super(key: key);
  final String title;

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AllMembers allMembers = AllMembers([]);
  ClientSdkService clientSdkService = ClientSdkService.getInstance();
  String atSign = ClientSdkService.getInstance().getAtSign().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hi! ' + ClientSdkService.getInstance().atsign,)
        ),

        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      child: Text('YourLists'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => YourLists()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('Group Lists'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TeamLists()));
                      },
                    ),
                    ElevatedButton(
                      child: Text('Settings'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TeamLists()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}




class YourLists extends StatefulWidget {
  @override
  YourListsState createState() => YourListsState();
}

class YourListsState extends State<YourLists> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(top: true, bottom: true, child: Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewListReDirect()));}, icon: Icon(Icons.menu))],

          title: Text("My ToDo Lists"),
        ),
        body: Center(
            child: Container(
              child:
              allToDoLists.allToDoLists.length>0 ? ListView.builder(
                scrollDirection: Axis.vertical,

                itemCount: allToDoLists.allToDoLists.length,
                itemBuilder: (BuildContext context, int index)
                {return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        child: Text(allToDoLists.allToDoLists[index].name),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>
                              ToDoList(allToDoLists.allToDoLists[index].name, allToDoLists.allToDoLists[index].listDescription, allToDoLists.allToDoLists[index].teamName)
                          ));
                        }
                    )
                );
                },
              ): Container(),
            )
        )
      // new ButtonBar(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //
      //     ElevatedButton(
      //       child: Text('Back'),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      // SizedBox(width: 142),
      // FloatingActionButton.extended(
      //   label: Text('Create A New List'),
      //   backgroundColor: Colors.orange,
      //   focusColor: Colors.white,
      //     onPressed: () {
      //       Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => NewListReDirect()));
      //         }
      //       )
      //   ]
      // )


    ),
    );

  }
}


class TeamLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Team ToDo Lists"),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      child: Text('Back'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 142),
                    FloatingActionButton.extended(
                      label: Text('Create A New List'),
                      backgroundColor: Colors.orange,
                      focusColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => YourLists()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}


class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Team Lists"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first route when tapped.
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}

class NewListReDirect extends StatefulWidget {

  @override
  _NewListReDirectState createState() => _NewListReDirectState();
}

class _NewListReDirectState extends State<NewListReDirect> {
  final listName = TextEditingController();
  final listDescription = TextEditingController();

  List stuffs = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("New ToDoList"),
        ),

        body: Column(
            children: [
              SizedBox(height: 80),
              // widget.someText,
              TextField(
                  decoration: InputDecoration(
                      hintText: "List Name",
                      labelText: "List Name",
                      labelStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      fillColor:  Colors.amber,
                      filled: true
                  ),
                  onChanged: (value) {

                  },
                  keyboardType: TextInputType.name,
                  maxLength: 100,
                  onSubmitted: (String value) {
                    stuffs.add(value);

                  }
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "List Description",
                  labelText: "List Description",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor:  Colors.amber,
                  filled: true,

                ),
                keyboardType: TextInputType.name,
                maxLength: 100,

              ),
              ElevatedButton(
                  child: Text("Create List"),
                  onPressed: () {

                    ToDoList newList = ToDoList(listName.text, listDescription.text);
                    allToDoLists.allToDoLists.add(newList);
                    print("List created");
                    Navigator.pop(context);
                  }
              ),
            ]
        )
    );
  }
}


class NewTaskReDirect extends StatefulWidget {


  @override
  _NewTaskReDirectState createState() => _NewTaskReDirectState();
}

class _NewTaskReDirectState extends State<NewTaskReDirect> {
  final taskName = TextEditingController();
  final taskCreated = TextEditingController();
  final taskDueBy = TextEditingController();

  List stuffs = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("New ToDoList"),
        ),

        body: Column(
            children: [
              SizedBox(height: 80),
              // widget.someText,
              TextField(
                  decoration: InputDecoration(
                      hintText: "List Name",
                      labelText: "List Name",
                      labelStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      fillColor:  Colors.amber,
                      filled: true
                  ),
                  onChanged: (value) {

                  },
                  keyboardType: TextInputType.name,
                  maxLength: 100,
                  onSubmitted: (String value) {
                    stuffs.add(value);

                  }
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Team Members",
                  labelText: "Team Members",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor:  Colors.amber,
                  filled: true,

                ),
                keyboardType: TextInputType.name,
                maxLength: 100,

              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Date Assigned",
                  labelText: "Date Due By",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor:  Colors.amber,
                  filled: true,

                ),
                keyboardType: TextInputType.name,
                maxLength: 100,

              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Date Due By",
                  labelText: "Date Due By",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  fillColor:  Colors.amber,
                  filled: true,

                ),
                keyboardType: TextInputType.name,
                maxLength: 100,

              ),
              ElevatedButton(
                  child: Text("Create Task"),
                  onPressed: () {

                    // Task newTask = Task(taskName.text, taskCreated.text, taskDueBy.text); //this line needs to reference a particular todolist. Comment it out to make the program work
                    // allTasks.add(newList);
                    print("List created");
                    Navigator.pop(context);
                  }
              ),
            ]
        )
    );
  }
}

class AllMembers {
  List<Member> allMembersList;

  AllMembers(this.allMembersList);

  addMember(name, teams, toDoList, atsign, profilepic) {
    Member newMember = Member(name, teams, toDoList, atsign, profilepic);
    allMembersList.add(newMember);
  }
}

class Member {
  String name;
  List<Team> teams = [];
  List<ToDoList> toDoList = [];
  String atsign;
  Image profilepic;
  // Class member initializes
  Member(this.name, this.teams, this.toDoList, this.atsign, this.profilepic);
}


class Team {
  String name;
  List<Member> listMembers = [];
  List<ToDoList> teamToDoLists = [];
  Image teamImage;

  Team(this.name, this.listMembers, this.teamToDoLists, this.teamImage);

  addMember(member) {
    listMembers.add(member);
    return "${member.name} added to ${this.name}!";
  }

  removeMember(member) {
    for (var i = 0; i < listMembers.length; ++i)
      if (listMembers[i].name == name) {
        listMembers.removeAt(i);
        return "You removed ${listMembers[i].name} from your list.";
      }
  }
}


class AllToDoLists {
  List<ToDoList> allToDoLists = [];

  AllToDoLists();

  addList(name, description) {
    ToDoList newList = ToDoList(name, description);
    this.allToDoLists.add(newList);


  }

  removeList(listName) {
    for (var i = 0; i < allToDoLists.length; ++i)
      if (allToDoLists[i].name == listName) {
        allToDoLists.removeAt(i);
        return "You removed ${allToDoLists[i].name}from your lists.";
      }
  }
}


class ToDoList extends StatefulWidget {
  final String name;
  final String teamName;
  final String listDescription;
  ToDoList(this.name, this.listDescription, [this.teamName = ""]);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<Task> allTasks = [];

  addTask(name, members, dateAssigned, dateDueBy) {

    Task newTask = Task(name, members, dateAssigned, dateDueBy);
    allTasks.add(newTask);

  }

  deleteTask(task, name) {

    for (var i = 0; i < allTasks.length; ++i)
      if (allTasks[i].name == name) {
        allTasks.removeAt(i);
        return "You removed ${allTasks[i].name}from your list.";
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTaskReDirect()));}, icon: Icon(Icons.menu))],
          title: Text("Your ToDoList"), //Why is the name not showing up here? Needs to be fixed
        ),

        body: Center(
            child: Container(
              child:
              this.allTasks.length>0 ? ListView.builder(
                scrollDirection: Axis.vertical,

                itemCount: this.allTasks.length,
                itemBuilder: (BuildContext context, int index)
                {return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        child: Text(this.allTasks[index].name),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) =>
                              Task(allTasks[index].name, allTasks[index].members, allTasks[index].dateAssigned, allTasks[index].dateDueBy)
                          ));
                        }
                    )
                );
                },
              ): Container(),
            )

        )
    );
  }
}




class Task extends StatelessWidget{
  String name;
  List<Member> members;
  String dateAssigned;
  String dateDueBy;

  Task(this.name, this.members, this.dateAssigned, this.dateDueBy);

  changeDateAssigned(date) {
    this.dateAssigned = date;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(

          title: Text("Hello, ${this.name}"), //Why is the name not showing up here? Needs to be fixed
        ),

        body: Center(
            child: Container(
                child: Text("task")
            )
        )
    );
  }
}