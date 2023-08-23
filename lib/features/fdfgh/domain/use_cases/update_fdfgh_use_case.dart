import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';
import 'package:vkreta-/features/fdfgh/domain/repositories/fdfgh_repository_base.dart';
import 'package:vkreta-/core/use_case/use_case_base.dart';
import 'package:dartz/dartz.dart';
import 'package:vkreta-/core/failures/failure.dart';

class UpdateFdfghUseCase extends UseCaseBase<Fdfgh, Fdfgh> {
   final FdfghRepositoryBase repository;
   
   UpdateFdfghUseCase(this.repository);
   
   @override
   Future<Either<Failure, Fdfgh>> call(Fdfgh fdfgh) async {
       return await repository.update(fdfgh);
   }
}
