class MyValidator {
  // MyValidator._();
  // static final MyValidator myValidator = MyValidator._();

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 11) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    // if (value.length != 11)
    //   return 'Mobile Number must be of 11 digit';
    else
      return null;
  }

  String validateNumber(String value) {
    String patttern = r'([0-9])';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Please enter amount";
    } else if (value.length < 1) {
      return "Please enter amount";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid input";
    }
    // if (value.length != 11)
    //   return 'Mobile Number must be of 11 digit';
    else
      return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    }
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regex = new RegExp(pattern);
    // if (!regex.hasMatch(value))
    //   return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 7)
      return 'Password must be more than 7 charater';
    else
      return null;
  }
}
