import 'package:expenditure_tracker/base_bloc.dart';
import 'package:expenditure_tracker/interface/navigation_router.dart';
import 'package:expenditure_tracker/interface/user.dart';
import 'package:expenditure_tracker/interface/user_auth.dart';
import 'package:rxdart/rxdart.dart';

/// Business logic for the user's account screen.
class AccountBloc extends BlocBase {
  final NavigationRouter _navigationRouter;
  final UserAuth _userAuth;

  Stream<User> get currentUserStream => _userAuth.currentUserStream();

  final _actionLinkAccountGoogle = BehaviorSubject<void>();
  Sink<void> get actionLinkAccountGoogle => _actionLinkAccountGoogle.sink;

  final _actionUnlinkAccount = BehaviorSubject<void>();
  Sink<void> get actionUnlinkAccount => _actionUnlinkAccount.sink;

  final _signOutAction = BehaviorSubject<void>();
  Sink<void> get signOutAction => _signOutAction.sink;

  final _deleteAccountAction = BehaviorSubject<void>();
  Sink<void> get deleteAccountAction => _deleteAccountAction.sink;

  AccountBloc(this._navigationRouter, this._userAuth) {
    _actionLinkAccountGoogle.stream.listen((_) async {
      await _userAuth.linkWithGoogle();
    });

    _actionUnlinkAccount.stream.listen((_) {
      /*_userAuth.currentUser().then((user) {
        // TODO(jaween): firebase_auth doesn't yet support unlinking from providers
      });*/
    });

    _signOutAction.stream.listen((_) async {
      await _userAuth.signOut();
    });

    _deleteAccountAction.stream.listen((_) async {
      await _userAuth.deleteAccount();
      // TODO(jaween): Add _navigationRoute.restart();
    });
  }

  @override
  void dispose() {
    _actionLinkAccountGoogle.close();
    _actionUnlinkAccount.close();
    _signOutAction.close();
    _deleteAccountAction.close();
  }
}