/********************* ANIMATED CONTAINTER CON BOTÓN PLAY
 * *********************
 *
 *   double _width = 50;
    double _height = 50;
    Color _color = Colors.green;
    BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
    body: Center(
    child: AnimatedContainer(
    // Use the properties stored in the State class.
    width: _width,
    height: _height,
    decoration: BoxDecoration(
    color: _color,
    borderRadius: _borderRadius,
    ),
    // Define how long the animation should take.
    duration: Duration(seconds: 1),
    // Provide an optional curve to make the animation feel smoother.
    curve: Curves.fastOutSlowIn,
    ),
    ),
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.play_arrow),
    // When the user taps the button
    onPressed: () {
    // Use setState to rebuild the widget with new values.
    setState(() {
    // Create a random number generator.
    final random = Random();

    // Generate a random width and height.
    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();

    // Generate a random color.
    _color = Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
    );

    // Generate a random border radius.
    _borderRadius =
    BorderRadius.circular(random.nextInt(100).toDouble());
    });
    },
    ),*/


/**************** INFORMATION PAGE STATE
    APP DE NOTAS CON BASE DE DATOS SQL LOCAL

    import 'package:hepapp/models/note.dart';
    import 'package:hepapp/pages/note_detail.dart';
    import 'package:hepapp/providers/db_provider.dart';
    import 'package:hepapp/widgets/menu_widget.dart';
    import 'package:sqflite/sqflite.dart';
    import 'note_detail.dart';
    import 'dart:async';


    DBProvider databaseHelper = DBProvider();
    List<Note> noteList;
    int count = 0;


    @override
    void initState() {
    super.initState();
    }

    @override
    Widget build(BuildContext context) {
    if (noteList == null) {
    noteList = List<Note>();
    updateListView();
    }


    return Scaffold(
    resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

    appBar: CustomAppBar(context, "Information"),
    drawer: MenuWidget(),
    body: getNoteListView(),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    debugPrint('FAB clicked');
    navigateToDetail(Note('', '', 2), 'Add Note');
    },

    tooltip: 'Add Note',

    child: Icon(Icons.add),

    ),
    );
    }

    ListView getNoteListView() {
    TextStyle titleStyle = Theme
    .of(context)
    .textTheme
    .subhead;

    return ListView.builder(
    itemCount: count,
    itemBuilder: (BuildContext context, int position) {
    return Card(
    color: Colors.white,
    elevation: 2.0,
    child: ListTile(

    leading: CircleAvatar(
    backgroundColor: getPriorityColor(
    this.noteList[position].priority),
    child: getPriorityIcon(this.noteList[position].priority),
    ),

    title: Text(this.noteList[position].title, style: titleStyle,),

    subtitle: Text(this.noteList[position].date),

    trailing: GestureDetector(
    child: Icon(Icons.delete, color: Colors.grey,),
    onTap: () {
    _delete(context, noteList[position]);
    },
    ),


    onTap: () {
    debugPrint("ListTile Tapped");
    navigateToDetail(this.noteList[position], 'Edit Note');
    },

    ),
    );
    },
    );
    }

    // Returns the priority color
    Color getPriorityColor(int priority) {
    switch (priority) {
    case 1:
    return Colors.red;
    break;
    case 2:
    return Colors.yellow;
    break;

    default:
    return Colors.yellow;
    }
    }

    // Returns the priority icon
    Icon getPriorityIcon(int priority) {
    switch (priority) {
    case 1:
    return Icon(Icons.play_arrow);
    break;
    case 2:
    return Icon(Icons.keyboard_arrow_right);
    break;

    default:
    return Icon(Icons.keyboard_arrow_right);
    }
    }

    void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
    _showSnackBar(context, 'Note Deleted Successfully');
    updateListView();
    }
    }

    void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
    }

    void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(
    context, MaterialPageRoute(builder: (context) {
    return NoteDetail(note, title);
    }));

    if (result == true) {
    updateListView();
    }
    }

    void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
    Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
    noteListFuture.then((noteList) {
    setState(() { //Al actualizar el estado se actualiza la UI
    this.noteList = noteList;
    this.count = noteList.length;
    });
    });
    });
    }*/