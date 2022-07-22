import 'package:flutter/material.dart';
import 'package:web_artel/functions.dart';

class ArtistPage extends StatefulWidget {
  final String? paymentId;

  const ArtistPage({Key? key, required this.paymentId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArtistPage(paymentId);
}

class _ArtistPage extends State<ArtistPage> {
  final String? paymentId;

  bool _checkStatus = false;

  final String email = "email@email.ru"; // TODO брать из токена

  _ArtistPage(this.paymentId);

  @override
  void initState(){
    super.initState();
    String? parameter;
    if(paymentId != null){
      parameter = paymentId;
    }
    if (parameter == null){
      final param = Uri.base.queryParameters['key'];
      if(param != null){
        parameter = param;
      }
    }
    if(parameter == null){
      //TODO проверять аккаунт в базе postgres - блок авторизации
      _checkStatus = true;
      return;
    }
    updatePage(parameter);
  }

  void updatePage(String parameter) async {
    await updatePayment(parameter);
    _checkStatus = await checkPayment(email);
  }

  Widget _buildPage(BuildContext context, bool isActivate){
    if(isActivate){
      return const Text("Succeded");
    }
    return Column(
      children: [
        const Text("Payment in status waiting"),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            checkPayment(email);
            },
          child: const Text('TextButton')
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context, _checkStatus);
  }
}

