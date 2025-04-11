import 'package:flutter/material.dart';
import 'package:payroll_app/pages/contract_form.dart';
import 'Widgets/Allowance.dart';
import 'Widgets/Contract.dart';
import 'Widgets/Dashboard.dart';
import 'Widgets/Reimbursements.dart';
import 'Widgets/deduction.dart';
import 'Widgets/loan.dart';
import 'Widgets/payslips.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF8A800),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF8A800), // Optional: Apply to AppBar
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "Contract";
  int selectedIndex = 0;
  String selectValueInGroupBy = "Group by";
  String selectValueInMoreOption = "More Option";
  String selectValueInActiveOption = "Active";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset('assets/spaceceImage.jpeg'),
          ),
          title: Text("Payroll Contracts"),
        ),
        endDrawer: Drawer(
          child: ListView(children: [DrawerHeader(child: Text("Header"))]),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              _buildSearchFilterBar(),
              _buildMoreOptionButton(),
              _buildTabs(),
              _getSelectedWidget(),

            ],
          ),
        ),
      ),
    );
  }
  Widget _getSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return DashboardWidgets();
      case 1:
        return ContractWidgets() ;
      case 2:
        return AllowanceCard();
      case 3:
        return DeductionWidgets();
      case 4:
        return PayslipsWidgets();
      case 5:
        return LoanWidgets();
      case 6:
        return ReimbursementsWidgets();
      default:
        return Center(child: Text("Federal Tax Section Coming Soon..."));

    }
  }

  Widget _buildTabs() {
    List<String> tab = ['Dashboard', 'Contract',
      'Allowance', 'Deductions',
      'Payslips','Loan / Advanced Salary',
    'Reimbursements','Federal Tax'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tab.length, (index) {
          return _buildTabButton(tab[index], selectedIndex == index, index);
        }),
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
            title = text;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
          backgroundColor: isSelected ? Color(0xFFF8A800) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Color(0xFFF8A800),
        ),
        child: Text(text,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF333333),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }


  Widget _buildMoreOptionButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: DropdownButton(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).primaryColor,
            ),
            value: selectValueInMoreOption,
            items:
                <String>[
                  "More Option",
                  "option2",
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectValueInMoreOption = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchFilterBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: InputBorder.none,
                // Disables the default underline
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.filter_alt_outlined, color: Color(0xFFF8A800)),
            onPressed: () {
              openDialog();
            },
            label: Text("filter", style: TextStyle(color: Color(0xFFF8A800))),
            style: ElevatedButton.styleFrom(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future openDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Filter'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContractForm()));
              }, child: Text("Contract")),
              ElevatedButton(onPressed: (){}, child: Text("Work info")),
              ElevatedButton(onPressed: (){}, child: Text("Advanced")),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Filter'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

}






