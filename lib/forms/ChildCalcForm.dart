import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/widgets/loading_dialog.dart';
import 'package:hepapp/widgets/notifications.dart';

import 'ChildCalcForm_bloc.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';

class ChildCalcForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    selectFieldBloc: formBloc.ascitesField,
                    //canDeselect: true,
                    decoration: InputDecoration(
                      //labelText: 'Ascites',
                      //TODO Hacer un row normal con el texto y luego el grupo de botones
                      //counterText: 'Prueba counter',
                      //fillColor: Colors.red,
                      //filled: true,
                      //TODO ESTE ES EL CUADRADITO INICIAL
                      /* icon: Container(
                        color: Color.fromARGB(255, 210, 242, 245),
                        width: 10.0,
                        height: 20.0,
                      ),
*/
                      border: InputBorder.none,
                      prefixIcon: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: <Widget>[
                            Container(
                              color: Color.fromARGB(255, 210, 242, 245),
                              width: 10.0,
                              height: 20.0,
                            ),
                            Container(width: 90,
                                padding: EdgeInsets.all(5),
                                child: Text('Ascites',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,

                                  ),)),
                          ],
                        ),
                      ),
                    ),
                    //itemBuilder: (context, item) => item,
                  ),
                  /*TextFieldBlocBuilder(
                    textFieldBloc: formBloc.textField,
                    decoration: InputDecoration(
                      icon: Icon(Icons.add),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelText: 'TextFieldBlocBuilder prueba',
                      prefixIcon: Icon(Icons.arrow_back_ios),
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
                  DropdownFieldBlocBuilder<String>(
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
                  ),
                  RadioButtonGroupFieldBlocBuilder<String>(
                    selectFieldBloc: formBloc.selectField2,
                    decoration: InputDecoration(
                      labelText: 'RadioButtonGroupFieldBlocBuilder',
                      prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                    ),
                    itemBuilder: (context, item) => item,
                  ),
                  CheckboxFieldBlocBuilder(
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
