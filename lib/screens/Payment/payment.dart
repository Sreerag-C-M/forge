import 'package:flutter/material.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/constants.dart';
import '../../Provider/add_to_cart_provider.dart';
import '../../models/orders.dart';
import '../Profile/widgets/orders.dart';

class PurchaseDetailsPage extends StatefulWidget {
  @override
  _PurchaseDetailsPageState createState() => _PurchaseDetailsPageState();
}

class _PurchaseDetailsPageState extends State<PurchaseDetailsPage> {
  late Razorpay _razorpay;
  String _paymentMode = 'Credit Card';
  List<OrderModel> orders = [];

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => YourOrdersScreen(
                  orders: [],
                )));
    print("Payment Successful: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    print("Payment Error: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    print("External Wallet: ${response.walletName}");
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': CartProvider.of(context, listen: false).totalPrice() * 100,
      // Amount in cent
      'name': "FORGE",
      'prefill': {'contact': '1234567890', 'email': 'testmail@example.com'},
      'external': {
        'wallets': ['paytm']
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        foregroundColor: kcontentColor,
        title: Text(
          'Purchase Details',
          style: TextStyle(fontSize: 19.sp, fontFamily: "Astonpoliz"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h,),
            Center(
              child: Text(
                "Click to make payment",
                style: TextStyle(color: Colors.white,fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 3.h,),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: _openCheckout,
                  child: Text(
                    'Make Payment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
