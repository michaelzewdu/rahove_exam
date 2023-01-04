import 'package:flutter/material.dart';
import 'package:rahove_exam/home.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 24, bottom: 8),
                child: Text(
                  'Welcome',
                  textScaleFactor: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Text('become a member of our platform'),
              TextFields(
                textFieldName: 'Full name',
              ),
              TextFields(textFieldName: 'Email'),
              TextFields(
                textFieldName: 'Password',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 100),
                      child: Text(
                        'Sign up',
                        textScaleFactor: 1.4,
                      ),
                    )),
              ),
              Row(
                children: [
                  Flexible(
                    child: Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign up with',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Flexible(
                    child: Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                        height: 30,
                        width: 30,
                        'assets/images/icons8-google-48.png'),
                    Image.asset(
                        height: 30,
                        width: 30,
                        'assets/images/icons8-facebook-48.png'),
                    Image.asset('assets/images/icons8-apple-logo-30.png'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Log in',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final textFieldName;
  const TextFields({Key? key, this.textFieldName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              textFieldName,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          TextField(
            onChanged: (value) {
              print(value);
            },
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
