import 'package:flutter/material.dart';



class DashboardWidgets extends StatelessWidget {
  const DashboardWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        _rowWidget('Paid','2'),
        _rowWidget('Confirmed','0'),
        _rowWidget('Review Ongoing','2'),
        _rowWidget('Draft','4'),
      ],
    );
  }


  Widget _rowWidget(String title,String number){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,
          horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFF8A800)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10 ,horizontal: 10),
                child: Text(title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40 ),
                child: Text(number,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

