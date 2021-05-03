import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_test/app//modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  late GlobalKey<FormState> _formKey;
  late FocusNode _focusCpf;
  late FocusNode _focusPassword;
  late TextEditingController _textEditingControllerUser;
  late TextEditingController _textEditingControllerPassword;
  late bool isProgress = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _focusCpf = FocusNode();
    _focusPassword = FocusNode();
    _textEditingControllerUser = TextEditingController();
    _textEditingControllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _focusCpf.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          isProgress
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: <Widget>[
                      /*TextFormField(
                      focusNode: _focusCpf,
                      decoration: InputDecoration(
                        labelText: 'user'
                      ),
                      onChanged: (value) => store.setUser(value),
                      //validator: (_) => controller.cpf.hasError(),
                    ), */

                      TextFormField(
                        focusNode: _focusCpf,
                        decoration: InputDecoration(labelText: 'user'),
                        controller: _textEditingControllerUser,
                        //onChanged: (value) => store.setUser(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),

                      /* TextFormField(
                      focusNode: _focusPassword,
                      decoration: InputDecoration(
                        labelText: 'senha'
                      ),
                      onChanged: (value) => store.setUser(value),
                      //validator: (_) => controller.loginPassword.hasError(),
                    ), */

                      TextFormField(
                        focusNode: _focusPassword,
                        decoration: InputDecoration(labelText: 'senha'),
                        controller: _textEditingControllerPassword,
                        //onChanged: (value) => store.setUser(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  isProgress = true;
                });

                if (_formKey.currentState!.validate()) {
                  await store.onClick(_textEditingControllerUser.text,
                      _textEditingControllerPassword.text, context);
                  /*ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));*/
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('invalid entries')));
                }

                setState(() {
                  isProgress = false;
                });
              },
              child: Text('Login'))
        ],
      ),
    );
  }
}
