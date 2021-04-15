import 'package:flutter/material.dart';
import '../shared/shared_widgets.dart';

class PaymentMethod extends StatefulWidget {
  static String id = "payment";
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
// user flutter hookController
    // final searchTextController = useTextEditingController();
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final accentColor = Theme.of(context).accentColor;
    return
        // (
        //     child:
        Scaffold(
      appBar: customAppBar('Payment'),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tightFor(
              height: screen.height, width: screen.width),
          margin: const EdgeInsets.only(
              right: 20.0, left: 20.0, top: 21.0, bottom: 28.0),
          // constraints:
          //     BoxConstraints.tightFor(height: screen.height, width: screen.width),
          // color: Theme.of(context).accentColor,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                // alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Payment Methods',
                        // textAlign: TextAlign.center,
                        style: textTheme.headline6,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/master-card.png',
                          scale: 1.3,
                        ),
                        Image.asset(
                          'assets/images/visa-card.png',
                          scale: 1.3,
                        ),
                        Image.asset(
                          'assets/images/verve-card.png',
                          scale: 1.3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                // alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Payment Via Bank Transfer',
                        // textAlign: TextAlign.center,
                        style: textTheme.headline6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: 'Bank Name: Access Bank',
                                style: textTheme.bodyText1.copyWith()),
                          ),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: 'Account Number: 1234567890',
                                  style: textTheme.bodyText1.copyWith())),
                          RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: 'Account Name: Wig Tools',
                                  style: textTheme.bodyText1.copyWith()))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Please note goods will be shipped only when payment has been confirmed',
                        // textAlign: TextAlign.center,
                        style: textTheme.subtitle2.copyWith(
                          height: 1.1,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 10.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Credit Card',
                        // textAlign: TextAlign.center,
                        style: textTheme.headline5.copyWith(
                          height: 1.1,
                          // color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/card-img.png',
                      scale: 1.8,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total',
                            // textAlign: TextAlign.center,
                            style: textTheme.headline6.copyWith(
                              height: 1.1,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'NGN {TOTAL_AMOUNT}',
                            // textAlign: TextAlign.center,
                            style: textTheme.headline5.copyWith(
                              height: 1.1,
                              // color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: screen.height * 0.035),
              // Spacer(),
              CommonActionButton(
                  txt: 'Upload Receipt',
                  borderRadius: BorderRadius.circular(50.0),
                  btnColor: accentColor,
                  txtColor: Colors.white,
                  action: () {}),
              SizedBox(height: 18.0),
              CommonActionButton(
                  txt: 'Upload Receipt',
                  borderRadius: BorderRadius.circular(50.0),
                  btnColor: Color(0xffffb6c1),
                  txtColor: Colors.white,
                  action: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
