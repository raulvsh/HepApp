import 'package:flutter/material.dart';

class OnlySelectChip extends StatefulWidget {
  final List<String> optionList;

  OnlySelectChip(this.optionList);

  @override
  _OnlySelectChipState createState() => _OnlySelectChipState();
}

class _OnlySelectChipState extends State<OnlySelectChip> {
  String selectedChoice = "";
  var reset = 0;

  // this function will build and return the choice list
  _buildChoiceList() {
    var altura = 10.0;
    List<Widget> choices = List();
    widget.optionList.forEach((item) {
      var isSelected = (selectedChoice == item) && (reset == 0);

      choices.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 5), // , vertical: 10),
        child: SizedBox(
          height: 20,
          //margin: EdgeInsets.all(5),
          child: ChoiceChip(
            label: Container(

              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                item,
                style: TextStyle(
                  height: 0.5,
                  fontSize: 13,
                  color: isSelected //(selectedChoice == item) && (reset==0)
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            selected: isSelected,
            //(selectedChoice == item), //&& reset == 0,
            selectedColor: isSelected //(selectedChoice == item) && (reset==0)
                ? Theme.of(context).primaryColor
                : Colors.white,
            backgroundColor: isSelected //(selectedChoice == item) && (reset==0)
                ? Theme.of(context).primaryColor
                : Colors.white,
            avatarBorder: CircleBorder(
              side: BorderSide(
                color: Colors.red,
                width: 2,
              ),
              //color: Color.fromARGB(255, 45, 145, 155), //Color del borde
              //width: 1.3,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: Color.fromARGB(255, 45, 145, 155)),

              borderRadius: new BorderRadius.all(new Radius.circular(3.0)),

              //)
            ),

            onSelected: (selected) {
              setState(() {
                print("reset " + reset.toString());
                reset = 0;
                selectedChoice = item;
                //widget.field = item.toString();
                //print("despues de reset field " + widget.selectFieldBloc.toString());

                //selectedChoice = "1" as String;
              });
            },
          ),
        ),
      ));
    });
    choices.add(SizedBox(
      height: 20,
      child: RaisedButton(
        onPressed: resetear,
        child: Text("reset"),
      ),
    ));
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    //devolverSeleccionado(selectedChoice);
    print(devolverSeleccionado(selectedChoice));
    return Wrap(
      children: _buildChoiceList(),
    );
  }

  resetear() {
    reset = 1;
    setState(() {});
  }

  devolverSeleccionado(String a) {
    return selectedChoice;
  }
}
