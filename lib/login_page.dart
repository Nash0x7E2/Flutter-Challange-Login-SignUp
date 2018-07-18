import 'package:flutter/material.dart';
import 'package:getting_started_pages/signup_page.dart';

class LoginPage extends StatelessWidget {
  Widget _buildTextFied(
      BuildContext context, String labelText, bool isPassowrd) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Theme(
        data: Theme.of(context).copyWith(
              primaryColor: Colors.white.withOpacity(0.5),
            ),
        child: TextField(
          obscureText: isPassowrd,
          focusNode: FocusNode(),
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme
                .of(context)
                .textTheme
                .body1
                .copyWith(color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }

  _buildFormAndLogo(BuildContext context) {
    return ClipPath(
      clipper: AngledClipper(),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            SizedBox(height: 23.0, width: double.infinity),
            Center(
              child: Image.asset(
                'assets/logo_blue.png',
                height: 100.0,
                width: 100.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(' Login', style: Theme.of(context).textTheme.display3),
            _buildTextFied(context, 'Email', false),
            _buildTextFied(context, 'Password', true),
            SizedBox(height: 30.0),
            Center(
              child: OutlineButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child:
                      Text('LOGIN', style: Theme.of(context).textTheme.body1),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //The scaffold does not resize and thus the clipper stays beautify
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => SignUpPage()),
              );
        },
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  minHeight: constraints.maxHeight,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _buildFormAndLogo(context),
                    Positioned(
                      bottom: 20.0,
                      left: 12.0,
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AngledClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 250);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
