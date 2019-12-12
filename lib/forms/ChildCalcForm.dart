import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/widgets/loading_dialog.dart';
import 'package:hepapp/widgets/notifications.dart';

import 'ChildCalcForm_bloc.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';
import 'CustomTextFieldBlocBuilder.dart';

class ChildCalcForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return BlocProvider<ChildCalcFormBloc>(
      builder: (context) => ChildCalcFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<ChildCalcFormBloc>(context);

          return Scaffold(
            //appBar: AppBar(title: Text('Form Fields Example')),
            body: FormBlocListener<ChildCalcFormBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithSuccess(
                    context, state.successResponse);
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);
                Notifications.showSnackBarWithError(
                    context, state.failureResponse);
              },
              child: ListView(
                //physics: ClampingScrollPhysics(),
                children: <Widget>[
                  CustomButtonGroupFieldBlocBuilder(
                    selectFieldBloc: formBloc.encephalopatyField,
                    text: aux.tr('encephalopaty'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    //itemBuilder: (context, item) => item,
                  ),
                  CustomButtonGroupFieldBlocBuilder(
                    selectFieldBloc: formBloc.tumourPercentageField,
                    text: aux.tr('tumour_extent'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    //itemBuilder: (context, item) => item,
                  ),
                  CustomButtonGroupFieldBlocBuilder(
                    selectFieldBloc: formBloc.ascitesField,
                    text: aux.tr('ascites'),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    //itemBuilder: (context, item) => item,
                  ),
                  TextFieldBlocBuilder(

                    cursorColor: Theme
                        .of(context)
                        .primaryColor,
                    keyboardType: TextInputType.numberWithOptions(),
                    isEnabled: true,
                    //Controlo si está activo o no, útil para cuando elijo número de tumores
                    textFieldBloc: formBloc.textField,

                    expands: false,

                    style: TextStyle(
                      fontSize: 12,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                    decoration:

                    InputDecoration(
                      //fillColor: Colors.yellow,
                      //labelText: 'hola',
                      //filled: true,
                      //prefixText: 'prueba',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(
                            255, 45, 145, 155),), //color: Colors.red),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(
                            255, 45, 145, 155),), //color: Colors.red),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      icon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            color: Color.fromARGB(255, 210, 242, 245),
                            width: 10.0,
                            height: 20.0,
                          ),
                          Container(
                            //color: Colors.red,
                            //width: 90,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                aux.tr('bilirubin'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              )),
                        ],
                      ),

                      /*border:

                          OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                            width: 1.0, color: Colors.red),
                      ),*/
                      errorStyle: TextStyle(
                        backgroundColor: Colors.yellow,
                      ),

                      //labelText: 'TextFieldBlocBuilder prueba',
                      //prefixIcon: Icon(Icons.arrow_back_ios),
                    ),
                    errorBuilder: (context, error) {
                      switch (error) {
                        case ValidatorsError.requiredTextFieldBloc:
                          return 'You must write amazing text.';
                          break;
                        default:
                          return 'This text is nor valid.';
                      }
                    },
                  ),


                  /*DropdownFieldBlocBuilder<String>(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                    selectFieldBloc: formBloc.selectField1,
                    decoration: InputDecoration(
                      labelText: 'DropdownFieldBlocBuilder',
                      // prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                    ),
                    itemBuilder: (context, value) => value,
                  ),
                  CheckboxGroupFieldBlocBuilder<String>(
                    multiSelectFieldBloc: formBloc.multiSelectField,
                    itemBuilder: (context, item) => item,
                    decoration: InputDecoration(
                      labelText: 'CheckboxGroupFieldBlocBuilder',
                      prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                    ),
                  ),*/
                  /*RadioButtonGroupFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.selectField2,
                    decoration: InputDecoration(
                      labelText: 'RadioButtonGroupFieldBlocBuilder',
                      prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                    ),
                    itemBuilder: (context, item) => item,
                  ),*/
                  /*CheckboxFieldBlocBuilder(
                    booleanFieldBloc: formBloc.booleanField,
                    body: Text('CheckboxFieldBlocBuilder'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: formBloc.submit,
                      child: Center(child: Text('SUBMIT')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RaisedButton(
                      onPressed: formBloc.clear,
                      child: Center(child: Text('CLEAR')),
                    ),
                  ),*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
