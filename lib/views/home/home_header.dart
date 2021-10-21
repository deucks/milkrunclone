import 'package:flutter/material.dart';

class Home_Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivering to:',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text('BONDI JUNCTION 2022',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.grey),
            child: Row(
              children: [
                Icon(Icons.timer),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'CLOSED',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
