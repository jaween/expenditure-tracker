import 'package:expenditure_tracker/interface/expenditure.dart';
import 'package:meta/meta.dart';

class NavigationRouter {
  final void Function() onNavigateBack;
  final void Function() onNavigateToExpenditureHistoryScreen;
  final void Function(Expenditure expenditure) onNavigateToCreateScreen;
  final void Function() onNavigateToLoginScreen;

  NavigationRouter({
    @required this.onNavigateBack,
    @required this.onNavigateToExpenditureHistoryScreen,
    @required this.onNavigateToCreateScreen,
    @required this.onNavigateToLoginScreen,
  });

  void navigateBack() => onNavigateBack;
  void navigateToExpenditureHistoryScreen() => onNavigateToExpenditureHistoryScreen();
  void navigateToCreateScreen({Expenditure expenditure}) => onNavigateToCreateScreen(expenditure);
  void navigateToLoginScreen() => onNavigateToLoginScreen();
}
