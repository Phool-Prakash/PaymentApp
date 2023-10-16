import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentScreen1 extends StatefulWidget {
  const PaymentScreen1({super.key});

  @override
  State<PaymentScreen1> createState() => _PaymentScreen1State();
}

class _PaymentScreen1State extends State<PaymentScreen1> {
  List<String> creditCards = [
    '**** **** **** 9873',
    '**** **** **** 8938',
    '**** **** **** 6636'
  ];

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController ccvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment method',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: creditCards.length + 1,
                  itemBuilder: (context, index) {
                    if (index < creditCards.length) {
                      String lastFourDigits = creditCards[index].substring(15);
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 8),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: screenWidth,
                            height: 75,
                            // padding:
                            // const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              color: const Color.fromRGBO(235, 238, 231, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.only(right: 10,top:5),
                              leading: CircleAvatar(
                                  radius: (52),
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: SvgPicture.asset('Assets/visa.svg'),
                                  )),
                              title: Text('Credit Card $lastFourDigits'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Remove the credit card from the list
                                  setState(() {
                                    creditCards.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: InkWell(
                          onTap: () {
                            _showAddCardBottomSheet(context);
                          },
                          child: Container(
                            width: screenWidth,
                            height: 72,
                            decoration: ShapeDecoration(
                              color: const Color.fromRGBO(235, 238, 231, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      radius: (30),
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child:
                                            SvgPicture.asset('Assets/add.svg'),
                                      )),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  const SizedBox(
                                    width: 263,
                                    child: Text(
                                      'Add new card',
                                      style: TextStyle(
                                        color: Color(0xFF2A2C33),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCardBottomSheet(BuildContext context) {
    double sheetwidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: SizedBox(
                  width: sheetwidth,
                  child: const Text(
                    'Add new card',
                    style: TextStyle(
                      color: Color(0xFF2A2C33),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    hintText: 'Card Number',
                    border: const OutlineInputBorder(),
                    suffix: SvgPicture.asset('Assets/cardsuffix.svg')),
                keyboardType: TextInputType.number,
              ), const SizedBox(
                height:20,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: expirationController,
                      decoration:InputDecoration(
                       suffix: SvgPicture.asset('Assets/expiry.svg'),
                          contentPadding: const EdgeInsets.all(14),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          hintText: 'Expiry',
                          hintStyle: const TextStyle(
                            color: Color(0xFFA4A7B0),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                          ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12.0), // Add spacing between the fields
                  Flexible(
                    child: TextFormField(
                      controller: ccvController,
                      decoration: InputDecoration(
                        suffix: SvgPicture.asset('Assets/cvv.svg'),
                        contentPadding: const EdgeInsets.all(14),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        // border: const OutlineInputBorder(),
                        hintText: 'CVV',
                        hintStyle: const TextStyle(
                          color: Color(0xFFA4A7B0),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: sheetwidth,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    // Add the entered card details to the list
                    String cardDetails =
                        '**** **** **** ${cardNumberController.text.substring(cardNumberController.text.length - 4)}';
                    setState(() {
                      creditCards.add(cardDetails);
                    });
                    // Clear the text fields
                    cardNumberController.clear();
                    expirationController.clear();
                    ccvController.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Add card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expirationController.dispose();
    ccvController.dispose();
    super.dispose();
  }
}

// //

//This is solid data code for the paymentScreen

// SizedBox(
// width: screenWidth,
// height: screenHeight,
// child: Column(
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 16.0, right: 16),
// child: InkWell(
// onTap: () {},
// child: Container(
// width: screenWidth,
// height: 72,
// padding:
// const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color.fromRGBO(235, 238, 231, 1),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: (52),
// backgroundColor: Colors.white,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(50),
// child: SvgPicture.asset('Assets/master.svg'),
// )),
// const SizedBox(
// width: 20,
// ),
// const Text(
// 'Mastercard 9873',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black,
// fontSize: 16,
// fontFamily: 'Inter',
// fontWeight: FontWeight.w600,
// height: 0,
// ),
// )
// ],
// ),
// IconButton(
// onPressed: () {}, icon: const Icon(Icons.delete))
// ],
// ),
// ),
// ),
// ),
// const SizedBox(height:8,),
// Padding(
// padding: const EdgeInsets.only(left: 16.0, right: 16),
// child: InkWell(
// onTap: () {},
// child: Container(
// width: screenWidth,
// height: 72,
// padding:
// const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color.fromRGBO(235, 238, 231, 1),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: (52),
// backgroundColor: Colors.white,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(50),
// child: SvgPicture.asset('Assets/visa.svg'),
// )),
// const SizedBox(
// width: 20,
// ),
// const Text(
// 'Visa 8938',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black,
// fontSize: 16,
// fontFamily: 'Inter',
// fontWeight: FontWeight.w600,
// height: 0,
// ),
// )
// ],
// ),
// IconButton(
// onPressed: () {}, icon: const Icon(Icons.delete))
// ],
// ),
// ),
// ),
// ),
// const SizedBox(height:8,),
// Padding(
// padding: const EdgeInsets.only(left: 16.0, right: 16),
// child: InkWell(
// onTap: () {},
// child: Container(
// width: screenWidth,
// height: 72,
// padding:
// const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color.fromRGBO(240, 242, 248, 1),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: (52),
// backgroundColor: Colors.white,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(50),
// child: SvgPicture.asset('Assets/visa.svg'),
// )),
// const SizedBox(
// width: 20,
// ),
// const Text(
// 'Visa 8938',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.black,
// fontSize: 16,
// fontFamily: 'Inter',
// fontWeight: FontWeight.w600,
// height: 0,
// ),
// )
// ],
// ),
// IconButton(
// onPressed: () {}, icon: const Icon(Icons.delete))
// ],
// ),
// ),
// ),
// ),
// const SizedBox(height:8,),
// Padding(
// padding: const EdgeInsets.only(left: 16.0, right: 16),
// child: InkWell(
// onTap: () {},
// child: Container(
// width: screenWidth,
// height: 72,
// padding:
// const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// decoration: ShapeDecoration(
// color: const Color.fromRGBO(235, 238, 231, 1),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: (52),
// backgroundColor: Colors.white,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(50),
// child: SvgPicture.asset('Assets/visa.svg'),
// )),
// const SizedBox(
// width: 20,
// ),
// const Text(
// 'Add new card',
// style: TextStyle(
// color: Color(0xFF2A2C33),
// fontSize: 14,
// fontFamily: 'Inter',
// fontWeight: FontWeight.w600,
// height: 0,
// ),
// )
// ],
// ),
// ],
// ),
// ),
// ),
// )
// ],
// ),
// )
