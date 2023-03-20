import 'package:hive/hive.dart';
import 'package:hrms/screens/model/user.dart';

final _MyBox = Hive.box('data');

class UserPreferences {
  var myUser = User(
    imagePath: 'http://10.7.216.72:5000/images?username=${_MyBox.get("user")}&filename=pp',
    // 'https://media.licdn.com/dms/image/C4E03AQFwykLoPhnVTQ/profile-displayphoto-shrink_800_800/0/1630860315538?e=1679529600&v=beta&t=l1gxIp45e8XEsOPC2B_mbc9D8wJ5p4KePteMbTOJdwk',
    name: "${_MyBox.get('firstName')} ${_MyBox.get('lastName')}",
    email: "${_MyBox.get('email')}",
    about:
        'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    isDarkMode: false,
  );
}
