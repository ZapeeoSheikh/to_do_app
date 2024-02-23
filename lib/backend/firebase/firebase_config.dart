import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';

Future initFirebase() async {
    if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
            name: 'Todo',
            options: DefaultFirebaseOptions.currentPlatform,
        ).whenComplete(() {
            print("completedAppInitialize");
        });
    }
}
