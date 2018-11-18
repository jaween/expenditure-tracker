import 'package:expenditure_tracker/interface/user.dart';
import 'package:expenditure_tracker/interface/expenditure.dart';

abstract class Repository {

  Stream<List<Expenditure>> get expenditures;

  Repository(User user);

  Future<void> createOrUpdateExpenditure(Expenditure expenditure);
  Future<void> deleteExpenditure(Expenditure expenditure);
}