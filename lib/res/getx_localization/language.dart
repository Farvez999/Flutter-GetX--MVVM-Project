import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'email_hint' : 'Enter Email',
      'internet_exception' : 'We are unable to show results. \nPlease check your data \nconnection',
      'general_exception' : 'We are unable to process your request \nPlease try again',
      'welcome_back': 'Welcome Back',
      'login':'Login',
      'email_hint':'Email',
      'password_hint':'Password',
    },
    'bn_BD' : {
      'email_hint' : 'Tomar Email Dao'
    }
  };
}