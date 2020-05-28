import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymantWebviewScreen extends StatefulWidget {
  @override
  _PaymantWebviewScreenState createState() => _PaymantWebviewScreenState();
}

class _PaymantWebviewScreenState extends State<PaymantWebviewScreen> {
  WebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата'),
      ),
      body: Container(
        child: WebView(
          onWebViewCreated: (WebViewController c) async {
            webViewController = c;
          },
          initialUrl:
              'https://api.paybox.money/payment.php?pg_merchant_id=529425&pg_amount=69&pg_currency=KGS&pg_description=%D0%9F%D0%BE%D0%B4%D0%BF%D0%B8%D1%81%D0%BA%D0%B0+%D0%BD%D0%B0+%D0%BC%D0%B5%D1%81%D1%8F%D1%86&pg_salt=Ld2iBkQckTZpWU3C&pg_language=ru&pg_sig=706d32640cdc0d79a4d8bb6f5f890649',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
