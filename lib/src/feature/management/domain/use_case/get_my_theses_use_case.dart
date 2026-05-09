import 'package:sfu/src/feature/management/domain/entity/thesis.dart';

abstract class GetMyThesesUseCase {
  Future<List<Thesis>> call();
}