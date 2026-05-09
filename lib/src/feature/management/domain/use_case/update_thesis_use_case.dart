import 'package:sfu/src/feature/management/domain/entity/thesis.dart';

abstract class UpdateThesisUseCase {
  Future<Thesis> call(String id, {String? title, bool? isFree});
}
