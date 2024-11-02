import 'package:flutter/material.dart';

class Birthdatefield extends StatelessWidget {
  const Birthdatefield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      // child: TextField(
      //   controller: _dateController,
      //   decoration: InputDecoration(
      //     labelText: "Birth Date",
      //     // filled: true,
      //     prefixIcon: Icon(Icons.calendar_today),
      //     focusedBorder: OutlineInputBorder(
      //       borderSide: BorderSide(width: 2, color: TextColor1),
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.black),
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //   ),
      //   readOnly: true,
      //   onTap: () {
      //     _selectDate();
      //   },
      // ),
    );
  }

////show date picker method
  // Future<void> _selectDate() async {
  //   DateTime? _picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime(2004),
  //       firstDate: DateTime(1960),
  //       lastDate: DateTime(2004));
  //   if (_picked != null) {
  //     setState(() {
  //       _dateController.text = _picked.toString().split(" ")[0];
  //     });
  //   }
  // }
}
