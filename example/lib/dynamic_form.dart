import 'package:flutter/material.dart';
import 'package:flutter_components/widget/flutter_core_widgets.dart';
import 'package:flutter_components/widget/flutter_core_widgets.dart';
import 'package:flutter_components/widget/flutter_scafold_widget.dart';
import 'dart:core';

import 'package:flutter_components_example/widget_enum.dart';

class DynamicForm extends StatelessWidget {
  const DynamicForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicFormPage(title: 'Flutter Dynamic Form'),
      // home: CustomCheckBox(),
    );
  }
}

class DynamicFormPage extends CoreWidgets {
  const DynamicFormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends CoreWidgetsState<DynamicFormPage>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  var mapValues = {
    {
      'typeofWidget': WidgetType.textField,
      'hint': "Enter your mobile Number",
      'labelText': 'Mobile Number',
      'maxLength': 10,
      'minLength': 10,
      'isRequired': true,
      'selectedData': '1',
    },
    {
      'typeofWidget': WidgetType.dropDown,
      'isRequired': true,
      'data': ['1', '2'],
      'selectedData': '1',
    },
    {
      'typeofWidget': WidgetType.searchTextField,
      'isRequired': true,
      'isDataFromPrevious': true,
      'data': [
        'Alexia',
        'Seema',
        'chinnadurai',
        'Nandhakumar',
        'Alwin',
        'Sathis',
        'Mani'
      ],
      'selectedData': '',
      'hint': "Enter your mobile Number",
    },
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      home: FlutterScaffold(
        isAppBar: true,
        toolBarTitleString: 'Dynamic Form',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: mapValues
                      .map((e) => SizedBox(
                            child: e['typeofWidget'] == WidgetType.textField
                                ? TextField(
                                    decoration: InputDecoration(
                                        hintText: e['hint'].toString()),
                                  )
                                : e['typeofWidget'] == WidgetType.dropDown
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButton<String>(
                                          items: (e['data'] as List<String>)
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: e['selectedData'].toString(),
                                          onChanged: (values) {
                                            setState(() {
                                              e['selectedData'] = values!;
                                            });
                                          },
                                        ),
                                      )
                                    : e['typeofWidget'] ==
                                            WidgetType.searchTextField
                                        ? Autocomplete<String>(
                                            optionsBuilder: (TextEditingValue
                                                textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return (e['data'] as List<String>)
                                                  .where((String option) {
                                                return option
                                                    .toLowerCase()
                                                    .contains(textEditingValue
                                                        .text
                                                        .toLowerCase());
                                              });
                                            },
                                            onSelected: (String selection) {
                                              setState(() {
                                                e['selectedData'] = selection;
                                              });
                                            },
                                          )
                                        : null,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
