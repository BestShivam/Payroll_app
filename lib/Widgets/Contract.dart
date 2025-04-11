import 'package:flutter/material.dart';

class ContractWidgets extends StatefulWidget {
  const ContractWidgets({super.key});

  @override
  State<ContractWidgets> createState() => _ContractWidgetsState();
}

class _ContractWidgetsState extends State<ContractWidgets> {
  String title = "Contract";
  int selectedIndex = 0;
  String selectValueInGroupBy = "Select";
  String selectValueInMoreOption = "More Option";
  String selectValueInActiveOption = "Active";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // GroupByButton
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF8A800),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Group by',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20,),
                  DropdownButton(
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    value: selectValueInGroupBy,
                    dropdownColor: Color(0xFFF8A800),
                    items:
                        <String>[
                          "Select",
                          "Employee",
                          'Job position',
                          'Department',
                          'Status',
                          'Shift',
                          'Work Type',
                          'Job role',
                          'Reporting Manger',
                          'Company'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectValueInGroupBy = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          // This makes ListView take only the necessary height
          physics: NeverScrollableScrollPhysics(),
          // Prevents ListView from scrolling inside SingleChildScrollView
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildEmployeeCard();
          },
        ),
      ],
    );
  }

  Widget _buildEmployeeCard() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://s3-alpha-sig.figma.com/img/331e/4bd2/ed5483c13b6d7ae42ccfb96f3e0ca111?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=bVlqs7DI5w7uksG8mgIOIrhJ2hI~TUBMhOEOUwS0YC~WvMxZtz-aNibIGeG~roRGttvDILX9lIqXSBjwHteqkCCCQLE~344nJq9xp0sGoWJeTHXYsDjoRIt3~uNrQa-GF7qOxcB-ZQC4Fh~Vvvp9TQmMWHkAVUeurv3cD2zxMce4hpw1Nh9bLZFPdZtII1ihGUMwOFQoey~9y2KECkDZcVwECAPdtwxH96nt2hfhNz9w6aQZJOxlp7yFz3Mwjh5XLgSJPAE9S7~G3gFILeR3AHTtSeMKCbMd2OvXNfBV-i~fUtjnahtJwNh2F9A72LHP6N4F4MSyaNuu570g9dfjSQ__',
                      ),
                      radius: 32,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Employee\nName',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.edit_outlined, color: Color(0xFF333333)),
                    SizedBox(width: 8),
                    Icon(Icons.delete, color: Color(0xFFF44336)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Monthly Salary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Text(
                '\$1,253',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton(
                          value: selectValueInActiveOption,
                          items:
                              <String>[
                                "Active",
                                "D-active",
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectValueInActiveOption = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start-End Date',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Text(
                        '14/1/25 - 15/2/25',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
