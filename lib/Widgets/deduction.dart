import 'package:flutter/material.dart';



class DeductionWidgets extends StatefulWidget {
  const DeductionWidgets({super.key});

  @override
  State<DeductionWidgets> createState() => _DeductionWidgetsState();
}

class _DeductionWidgetsState extends State<DeductionWidgets> {
  String selectValueInGroupBy = "Group by";
  String selectValueInActiveOption = "Active";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // GroupByButton
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: ElevatedButton.icon(
                  onPressed: (){},
                  label: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,// Prevents extra space
                    children: [
                      Text("Create",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),), // Title at start
                      SizedBox(width: 8), // Space between title and icon (if needed)
                    ],
                  ),
                  icon: Icon(Icons.add,color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF8A800),
                      foregroundColor: Colors.white,
                      shape : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      )
                  ))
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
                      'Employee Name',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Taxable Salary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Rate of employment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.grey,
                              width: 1
                          )
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.grey,
                              width: 1
                          )
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      )
                  ),
                  child: Text(
                    '\$240 per hour',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                )

              ],
            ),

            SizedBox(height: 16),
            Text(
              'Based On',
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: Text(
                'Being Late',
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w500,
                color: Color(0xFFF44336)),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Amount',
              style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.grey,
                      width: 1
                  )
              ),
              child: Text(
                '\$1200',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

}




