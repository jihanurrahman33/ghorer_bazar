import 'dart:convert';
import 'package:bkash/bkash.dart';
import 'package:get/get.dart';

void onButtonTap(String selected) async {
  switch (selected) {
    case 'bkash':
      bkashPayment();
      break;

    // case 'uddoktapay':
    //   uddoktapay();
    //   break;

    // case 'sslcommerz':
    //   sslcommerz();
    //   break;

    // case 'shurjopay':
    //   shurjoPay();
    //   break;

    // case 'razorpay':
    //   razorPay();
    //   break;

    default:
      print('No gateway selected');
  }
}

double totalPrice = 1.00;

/// bKash
bkashPayment() async {
  final bkash = Bkash(
    logResponse: true,
  );

  try {
    final response = await bkash.pay(
      context: Get.context!,
      amount: totalPrice,
      merchantInvoiceNumber: 'Test0123456',
    );

    print(response.trxId);
    print(response.paymentId);
  } on BkashFailure catch (e) {
    print(e.message);
  }
}

// /// UddoktaPay
// void uddoktapay() async {
//   final response = await UddoktaPay.createPayment(
//     context: Get.context!,
//     customer: CustomerDetails(
//       fullName: 'Md Shirajul Islam',
//       email: 'ytshirajul@icould.com',
//     ),
//     amount: totalPrice.toString(),
//   );

//   if (response.status == ResponseStatus.completed) {
//     print('Payment completed, Trx ID: ${response.transactionId}');
//     print(response.senderNumber);
//   }

//   if (response.status == ResponseStatus.canceled) {
//     print('Payment canceled');
//   }

//   if (response.status == ResponseStatus.pending) {
//     print('Payment pending');
//   }
// }

// /// SslCommerz
// void sslcommerz() async {
//   Sslcommerz sslcommerz = Sslcommerz(
//     initializer: SSLCommerzInitialization(
//       multi_card_name: "visa,master,bkash",
//       currency: SSLCurrencyType.BDT,
//       product_category: "Digital Product",
//       sdkType: SSLCSdkType.TESTBOX,
//       store_id: "your_store_id",
//       store_passwd: "your_store_password",
//       total_amount: totalPrice,
//       tran_id: "TestTRX001",
//     ),
//   );

//   final response = await sslcommerz.payNow();

//   if (response.status == 'VALID') {
//     print(jsonEncode(response));

//     print('Payment completed, TRX ID: ${response.tranId}');
//     print(response.tranDate);
//   }

//   if (response.status == 'Closed') {
//     print('Payment closed');
//   }

//   if (response.status == 'FAILED') {
//     print('Payment failed');
//   }
// }

// void shurjoPay() async {
//   final shurjoPay = ShurjoPay();

//   final paymentResponse = await shurjoPay.makePayment(
//     context: Get.context!,
//     shurjopayRequestModel: ShurjopayRequestModel(
//       configs: ShurjopayConfigs(
//         prefix: 'NOK',
//         userName: 'sp_sandbox',
//         password: 'pyyk97hu&6u6',
//         clientIP: '127.0.0.1',
//       ),
//       currency: 'BDT',
//       amount: totalPrice,
//       orderID: 'test00255588',
//       customerName: 'Md Shirajul Islam',
//       customerPhoneNumber: '+8801700000000',
//       customerAddress: 'Dhaka, Bangladesh',
//       customerCity: 'Dhaka',
//       customerPostcode: '1000',
//       returnURL: 'url',
//       cancelURL: 'url',
//     ),
//   );

//   if (paymentResponse.status == true) {
//     try {
//       final verifyResponse = await shurjoPay.verifyPayment(
//           orderID: paymentResponse.shurjopayOrderID!);

//       if (verifyResponse.spCode == '1000') {
//         print(verifyResponse.bankTrxId);
//       } else {
//         print(verifyResponse.spMessage);
//       }

//       // if (verifyResponse.bankTrxId == null || verifyResponse.bankTrxId!.isEmpty || verifyResponse.bankTrxId == '') {
//       //
//       //   print('Something is wrong with your payment');
//       //
//       // }
//       // else {
//       //
//       //   print(verifyResponse.bankTrxId);
//       //   print(verifyResponse.message);
//       //
//       // }
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// void razorPay() async {
//   final razorPay = Razorpay();

//   var options = {
//     'key': 'rzp_test_HJG5Rtuy8Xh2NB',
//     'amount': totalPrice,
//     'name': 'Acme Corp.',
//     'description': 'Fine T-Shirt',
//     'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
//   };

//   try {
//     razorPay.open(options);

//     razorPay.on(
//       Razorpay.EVENT_PAYMENT_SUCCESS,
//       (PaymentSuccessResponse response) {
//         print('Payment success');
//         print(response.paymentId);
//       },
//     );

//     razorPay.on(
//       Razorpay.EVENT_PAYMENT_ERROR,
//       (PaymentFailureResponse response) {
//         print('Payment failed');
//         print(response.message);
//       },
//     );
//   } catch (e) {
//     print('Error ${e.toString()}');
//   }
// }
