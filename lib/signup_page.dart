import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  Widget _buildTextFied(
      BuildContext context, String labelText, bool isPassowrd) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Theme(
        data: Theme
            .of(context)
            .copyWith(primaryColor: Colors.white.withOpacity(0.5)),
        child: TextField(
          obscureText: isPassowrd,
          focusNode: FocusNode(),
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.body1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).accentColor,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset('assets/x_pink.png'),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Theme.of(context).accentColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: double.infinity),
              Center(
                child: Image.asset(
                  'assets/logo_pink.png',
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(' Register', style: Theme.of(context).textTheme.display3),
              _buildTextFied(context, 'First Name', false),
              _buildTextFied(context, 'Last Name', false),
              _buildTextFied(context, 'Email', false),
              _buildTextFied(context, 'Password', true),
              SizedBox(height: 30.0),
              Center(
                child: OutlineButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text(
                      'CREATE ACCOUNT',
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
