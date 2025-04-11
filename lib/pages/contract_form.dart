import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'check_box_state.dart';


class ContractForm extends StatefulWidget {
  const ContractForm({super.key});

  @override
  State<ContractForm> createState() => _ContractFormState();
}

class _ContractFormState extends State<ContractForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  final List<String> wageTypes = ['Daily', 'Monthly', 'Hourly'];
  String? selectedWageType;
  final List<String> payFrequency = ['Weekly','Monthly','Semi-Monthly'];
  String? selectedPayFrequency;
  final List<String> status = ['Draft','Active','Expire','Terminated'];
  String? selectedStatus;
  final notifications = [
    CheckBoxState(title: "Test"),
    CheckBoxState(title: "Individual"),
    CheckBoxState(title: "Heal of HouseHold (HOH)"),
    CheckBoxState(title: "Married Filing Jointly (MFJ)"),
    CheckBoxState(title: "Married Filing Separately (MFS)"),
    CheckBoxState(title: "Single Filers"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Date Picker Field"),
        backgroundColor: Colors.white,),
        body:  Padding(
          padding:  EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
              TextFormField(
              controller: _startDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Start Date',
                hintText: 'dd/MM/yyyy',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: startDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    startDate = pickedDate;
                    _startDateController.text =
                        DateFormat('dd/MM/yyyy').format(startDate!);

                  });
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a date';
                }
                return null;
              },
            ),
                // End Date
                SizedBox(height: 20,),
                TextFormField(
                  controller: _endDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'End Date',
                    hintText: 'dd/MM/yyyy',
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: endDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        endDate = pickedDate;
                        _endDateController.text =
                            DateFormat('dd/MM/yyyy').format(endDate!);

                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text('Wage Type'),
                  value: selectedWageType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedWageType = newValue;
                    });
                  },
                  items: wageTypes.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Text("Filing Status",
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      ...notifications.map(buildSingleCheckBox)

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text('Pay Frequency'),
                  value: selectedPayFrequency,
                  onChanged: (newValue) {
                    setState(() {
                      selectedPayFrequency = newValue;
                    });
                  },
                  items: payFrequency.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text('Status'),
                  value: selectedStatus,
                  onChanged: (newValue) {
                    setState(() {
                      selectedStatus = newValue;
                    });
                  },
                  items: status.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Done"))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkBox) => CheckboxListTile(
      value: checkBox.value,
      title: Text(checkBox.title),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) =>
          setState(() {
            checkBox.value = value!;
          }));
}
