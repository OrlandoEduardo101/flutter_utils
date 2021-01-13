import 'package:flutter/material.dart';

class CardProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned(
            top: 50,
            right: -50,
            child: CircleAvatar(
            radius: 130,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.4),
          )),
          Positioned(
            top: 100,
            right: 50,
            child: CircleAvatar(
            radius: 130,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
          )),
          Positioned(
            top: 120,
            right: 150,
            child: CircleAvatar(
            radius: 130,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Produto 1", 
                style:  TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),),
                SizedBox(
                  height: 10,
                ),
                Text("Produto 2",
                style:  TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),),
                Row(
                  children: [
                    Expanded(child: Text("Produto 4")),
                    Text("R\$ 20,00", style:  TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
