import 'dart:convert';

import 'package:expensemanager/generated/l10n.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/services/notification_manager.dart';
import 'package:expensemanager/services/organize_list.dart';
import 'package:expensemanager/services/settings.dart';
import 'package:flutter/material.dart';
import 'package:expensemanager/reminder/data/reminder.dart';
// import 'package:expensemanager/reminder/util/notification_manager.dart';
// import 'package:expensemanager/reminder/util/organize_list.dart';
import 'package:expensemanager/reminder/views/add_task.dart';
import 'package:expensemanager/reminder/widgets/task_full.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final String reminderKey = 'userReminders';
List<Reminder> reminders = [];
List<Reminder> remindersCopy = [];
Color appBarColor;

class MyHomePage extends StatefulWidget {
  static const String routeName = '/reminder';
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget taskList;
  int initialLength;
  // _MyHomePageState(Future<void> configureLocalTimeZone);

  Future<String> getReminders() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString(reminderKey) != null) {
      initialLength = reminderKey.length;
      return sp.getString(reminderKey);
    } else {
      return null;
    }
  }

  static void writeChangesToFile() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(reminderKey, json.encode(reminders));
  }

  static void deepCopyReminders() {
    remindersCopy = [];
    for (int i = 0; i < reminders.length; i++) {
      remindersCopy.add(reminders[i]);
    }
  }

  static void deepCopyBackToReminders() {
    reminders = [];
    for (int i = 0; i < remindersCopy.length; i++) {
      reminders.add(remindersCopy[i]);
    }
  }

  // Stream<String> get eminders async* {
  //   var i = reminders.length;
  //   while (reminders.length != initialLength) {
  //     await getReminders();
  //   }
  // }

  Widget getTaskList() {
    // Now you should be able to call the function like so

    if (reminders.length == 0) {
      //how to add translate this section
      return Text('Сануулагч нэмэх!');
    } else {
      setState(() {
        appBarColor = Theme.of(context).accentColor;
      });
      return ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final currentTask = reminders[index];
          print(currentTask.notificationID);
          return Dismissible(
            key: Key(currentTask.notificationID.toString()),
            onDismissed: (direction) {
              deepCopyReminders();
              reminders.remove(currentTask);
              cancelSpecificReminder(currentTask);
              writeChangesToFile();
              Scaffold.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text(S.of(context).reminderDeleted +
                      ' "${currentTask.cardTitle}" '),
                  action: SnackBarAction(
                    label: S.of(context).reminderDeletedUndo,
                    onPressed: () {
                      deepCopyBackToReminders();
                      setState(() {
                        taskList = getTaskList();
                      });
                      rescheduleNotification(currentTask);
                      writeChangesToFile();
                    },
                  )));
              setState(() {
                if (reminders.length == 0) {
                  appBarColor = Theme.of(context).accentColor;
                } else {
                  appBarColor = Theme.of(context).accentColor;
                }
              });
            },
            background: Container(color: Colors.transparent),
            child: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Task(
                  currentTask,
                  currentTask.cardTitle,
                  currentTask.cardSubText,
                  currentTask.cardColor,
                  currentTask.cardAccent),
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    if (initialLength != reminders.length) {
      reminders =
          []; //Wipe reminders so we don't have to worry about doubling up on existing reminders
      getReminders().then((String userData) {
        json
            .decode(userData)
            .forEach((map) => reminders.add(new Reminder.fromJson(map)));
        setState(() {
          taskList = getTaskList();
        });
      }).catchError((e) {
        print('failed to get data');
      });
      setState(() {
        taskList = getTaskList();
      });
    }
    // reminders =
    //     []; //Wipe reminders so we don't have to worry about doubling up on existing reminders
    // getReminders().then((String userData) {
    //   json
    //       .decode(userData)
    //       .forEach((map) => reminders.add(new Reminder.fromJson(map)));
    //   setState(() {
    //     taskList = getTaskList();
    //   });
    // }).catchError((e) {
    //   print('failed to get data');
    // });
    // setState(() {
    //   taskList = getTaskList();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsProvider>(context);

    // setState(() {
    //   taskList = getTaskList();
    // });
    return
        // StreamProvider(
        //   create: (_) => eminders,
        //   lazy: false,
        //   child:
        Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.pop(context, ModalRoute.withName('/settings'))),
        elevation: 2,
        title: Text(
          S.of(context).settingsReminderPreferences,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        actions: <Widget>[
          new PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (String organizeType) {
              setState(() {
                if (organizeType == 'alpha') {
                  reminders = organizeByAlphabet(reminders);
                } else if (organizeType == 'color') {
                  reminders = organizeByColor(reminders);
                } else if (organizeType == 'date') {
                  reminders = organizeByCreationDate(reminders);
                }
                writeChangesToFile();
                taskList = getTaskList();
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: null,
                child: const Text('Ангилах:'),
              ),
              const PopupMenuItem<String>(
                value: 'alpha',
                child: const Text('Үсгийн дарааллаар'),
              ),
              const PopupMenuItem<String>(
                value: 'color',
                child: const Text('Өнгөөр'),
              ),
              const PopupMenuItem<String>(
                value: 'date',
                child: const Text('Үүсгэсэн хугацаагаар'),
              ),
            ],
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: new Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: taskList,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTask(), maintainState: false));
        },
        tooltip: 'Сануулагч үүсгэх',
        elevation: 6.0,
        child: new Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ),
    );

    // onWillPop: () async => false,
  }
}
