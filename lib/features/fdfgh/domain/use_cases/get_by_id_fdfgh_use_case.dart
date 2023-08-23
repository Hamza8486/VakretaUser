import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';
import 'package:vkreta-/features/fdfgh/domain/repositories/fdfgh_repository_base.dart';
import 'package:vkreta-/core/use_case/use_case_base.dart';
import 'package:dartz/dartz.dart';
import 'package:vkreta-/core/failures/failure.dart';

class GetByIdFdfghUseCase extends UseCaseBase<Fdfgh, int> {
   final FdfghRepositoryBase repository;
   
   GetByIdFdfghUseCase(this.repository);
   
   @override
   Future<Either<Failure, Fdfgh>> call(int id) async {
       return await repository.getById(id);
   }
}
