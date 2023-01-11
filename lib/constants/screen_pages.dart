import 'package:bukit_vista_flutter_assessment/pages/accounting_page.dart';
import 'package:bukit_vista_flutter_assessment/pages/booking_page/booking_page.dart';
import 'package:bukit_vista_flutter_assessment/pages/my_property_page.dart';
import 'package:bukit_vista_flutter_assessment/pages/notification_page.dart';
import 'package:bukit_vista_flutter_assessment/pages/profile_page.dart';

class ScreenPages {
  static int currentNavigationBarIndex = 1;
  static final screens = [
    MyPropertyPage(),
    BookingPage(),
    AccountingPage(),
    NotificationPage(),
    ProfilePage(),
  ];
}
