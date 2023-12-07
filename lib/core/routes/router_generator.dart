import 'package:flutter/material.dart';
import 'package:loksewa/core/routes/routes.dart';
import 'package:loksewa/view/community/askqsn.dart';
import 'package:loksewa/view/home_view/dashboard.dart';
import 'package:loksewa/view/home_view/homepage.dart';
import 'package:loksewa/view/login/login_view.dart';
import 'package:loksewa/view/login/select_career.dart';
import 'package:loksewa/view/login/select_course.dart';
import 'package:loksewa/view/profile/edit_account.dart';
import 'package:loksewa/view/profile/loksewavideo.dart';
import 'package:loksewa/view/profile/prepare_loksewa.dart';
import 'package:loksewa/view/profile/trackprogress.dart';
import 'package:loksewa/view/quiz/qsnpart.dart';
import 'package:loksewa/view/quiz/result.dart';
import 'package:loksewa/view/resources/resource_view.dart';
import 'package:loksewa/view/splash_onboard/onboard_Screen.dart';
import 'package:loksewa/view/splash_onboard/splash_screen.dart';

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogInView());

      case Routes.career:
        return MaterialPageRoute(builder: (_) => SelectCareer());

      case Routes.course:
        return MaterialPageRoute(builder: (_) => SelectCourse());

      case Routes.selecteng:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case Routes.qsnPOS:
        return MaterialPageRoute(builder: (_) => QsnOfPartsOFSpeech());
      case Routes.result:
        return MaterialPageRoute(builder: (_) => const ResultPage());
      case Routes.askqsn:
        return MaterialPageRoute(builder: (_) => const AskQsn());
      case Routes.resourceView:
        return MaterialPageRoute(builder: (_) =>  const ResourcesView());
            case Routes.editAccount:
        return MaterialPageRoute(builder: (_) =>  const EditAccount());
                    case Routes.trackProgress:
        return MaterialPageRoute(builder: (_) => TrackMyProgress() );
          case Routes.prepareloksewa:
        return MaterialPageRoute(builder: (_) => PrepareLoksewa() );
          case Routes.loksewavideo:
        return MaterialPageRoute(builder: (_) => const LOksewaVideo());
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    }
  }
}
