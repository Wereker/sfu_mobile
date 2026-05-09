import 'package:sfu/src/feature/management/domain/entity/thesis.dart';

abstract class CreateThesisUseCase {
  Future<Thesis> call(String title);
}
