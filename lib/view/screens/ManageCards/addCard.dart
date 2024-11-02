import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradp2p/controller/ManageCards/AddCard_controller.dart';
import 'package:gradp2p/controller/ManageCards/SelectBank_controller.dart';
import 'package:gradp2p/core/functions/validInput.dart';
import 'package:gradp2p/view/widget/auth/custombuttonauth.dart';

class addCard extends StatelessWidget {
  const addCard({super.key});



  @override
  Widget build(BuildContext context) {
    final BankSelectionController bankSelectionController =
        Get.put(BankSelectionController());
    AddcardControllerImp controller = Get.put(AddcardControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cards'),
        centerTitle: true, // Center the title horizontally
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black54,
          ), // Leading arrow icon
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formstate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(() => DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            labelText: "Select your Bank",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors
                                      .blue), // Replace with TextColor1 if defined
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          items: <String>[
                            'National Bank of Egypt (NBE)',
                            'Banque Misr (BM)',
                            'Commercial International Bank (CIB)',
                            'Arab African International Bank (AAIB)',
                            'QNB Alahli'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            bankSelectionController.setSelectedBank(value!);
                          },
                          value:
                              bankSelectionController.selectedBank.value.isEmpty
                                  ? null
                                  : bankSelectionController.selectedBank.value,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validInput(val!, 16, 16, "card number");
                      },
                      controller: controller.cardNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                       // CardNumberInputFormatter(),
                      ],
                      decoration: const InputDecoration(
                        labelText: "Card number",
                        prefixIcon: ImageIcon(
                          AssetImage('assets/images/Bank Card.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 30, "name");
                      },
                      controller: controller.fullName,
                      decoration: const InputDecoration(
                        labelText: "full name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (val) {
                              return validInput(val!, 3, 3, "ccv");
                            },
                            controller: controller.ccv,
                            keyboardType: TextInputType.number,

                            // limit the input
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            decoration: const InputDecoration(
                              labelText: "cvv",
                              prefixIcon: ImageIcon(
                                AssetImage('assets/images/cvv.png'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (val) {
                              return validInput(val!, 5
                              , 5, "card date");
                            },
                            controller: controller.date,
                            keyboardType: TextInputType.number,

                            // limit the input
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter(),
                            ],
                            decoration: const InputDecoration(
                                labelText: "MM/YY",
                                prefixIcon:
                                    Icon(Icons.calendar_today_outlined)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validInput(val!, 4, 4, "card pin");
                      },
                      obscureText: controller.isshowpassword2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key_sharp),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.showhidePassword2();
                            },
                            icon: Icon(controller.isshowpassword2
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        labelText: "card pin ",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                Custombuttonauth(
                  buttonName: "confirm",
                  onPressed: () {
                    controller.addNCard();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;
      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
