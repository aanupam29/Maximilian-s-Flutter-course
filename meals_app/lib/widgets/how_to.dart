import 'package:flutter/material.dart';

class HowTo extends StatelessWidget {
  final List<String> steps;

  HowTo({this.steps});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(5),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (BuildContext _, int index) => Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(3),
          child: ListTile(
            title: Text(steps[index]),
            leading: CircleAvatar(
              child: Text(
                "# ${(index + 1).toString()}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //         border: Border.all(color: Colors.grey),
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(30),
          //         ),
          //       ),
          //       child:
          //     ),
          //     Text(steps[index]),
          //   ],
          // ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
