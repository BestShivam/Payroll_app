import 'package:flutter/material.dart';

class ReimbursementsWidgets extends StatefulWidget {
  const ReimbursementsWidgets({super.key});

  @override
  State<ReimbursementsWidgets> createState() => _ReimbursementsWidgetsState();
}

class _ReimbursementsWidgetsState extends State<ReimbursementsWidgets> {
  String selectValueInActiveOption = "Active";
  String selectValueInGroupBy = "Group by";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // GroupByButton
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _buildCreateWidget()),
            Expanded(child: _buildGroupBy()),
          ],
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
            Row(
              children: [
                _titleAndValueBox('Status', 'Fulfilled',  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4CAF50),
                  ),),
                SizedBox(width: 60),
                _titleAndValueBox('Date', '14/1/25',
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666666),
                  ),),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _titleAndValueBox('Amount', '\$1,053',
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666666),
                  ),),
                SizedBox(width: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Action",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              'Coffee & Tea\n Stock',
              style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildGroupBy(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8A800),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButton(
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            value: selectValueInGroupBy,
            dropdownColor: Color(0xFFF8A800),
            items:
            <String>["Group by", "option2"].map<DropdownMenuItem<String>>((
                String value,
                ) {
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
        ),
      ),
    );
  }
  Widget _buildCreateWidget() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          // Prevents extra space
          children: [
            Text(
              "Create",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ), // Title at start
            SizedBox(width: 8), // Space between title and icon (if needed)
          ],
        ),
        icon: Icon(Icons.add, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF8A800),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

Widget _titleAndValueBox(String title, String value, TextStyle textStyle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      SizedBox(height: 4),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Text(
          value,
          style: textStyle,
          // TextStyle(
          //   fontSize: valueFontSize,
          //   fontWeight: FontWeight.w500,
          //   color: Color(0xFF666666),
          // ),
        ),
      ),
    ],
  );
}
