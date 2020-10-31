import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';
import 'dart:io';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  // Token _paymentToken;

  // PaymentMethod _paymentMethod;

  // String _error;

  // final String _currentSecret = null;
  // PaymentIntentResult _paymentIntent;

  // Source _source;

  @override
  initState() {
    super.initState();

    // StripePayment.setOptions(StripeOptions(
    //     publishableKey:
    //         "pk_test_51HYRZvKZUUcbCKQEwGEKq5KN3dmQKUIxjEZRuH4u6MzjGiYKfmyXl6OOfdqttATIbOiY0NLN4NnRTRliEjeALvz500SY78va9P",
    //     merchantId: "Test",
    //     androidPayMode: 'test'));
  }

  // void setError(dynamic error) {
  //   print(error.toString());
  // }

  // final CreditCard testCard = CreditCard(
  //   number: '4000002760003184',
  //   expMonth: 12,
  //   expYear: 21,
  // );

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Native payment"),
      onPressed: () {
        // StripePayment.paymentRequestWithNativePay(
        //   androidPayOptions: AndroidPayPaymentRequest(
        //     totalPrice: "1.20",
        //     currencyCode: "EUR",
        //   ),
        //   applePayOptions: ApplePayPaymentOptions(
        //     countryCode: 'DE',
        //     currencyCode: 'EUR',
        //     items: [
        //       ApplePayItem(
        //         label: 'Test',
        //         amount: '13',
        //       )
        //     ],
        //   ),
        // ).then((token) {
        //   setState(() {
        //     _paymentToken = token;
        //   });
        // }).catchError(setError);
      },
    );
  }
}
