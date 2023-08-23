import 'package:vkreta-/features/fdfgh/domain/repositories/fdfgh_repository_base.dart';
import 'package:vkreta-/core/use_case/use_case_base.dart';
import 'package:dartz/dartz.dart';
import 'package:vkreta-/core/failures/failure.dart';

class DeleteFdfghUseCase extends UseCaseBase<void, int> {
   final FdfghRepositoryBase repository;
   
   DeleteFdfghUseCase(this.repository);
   
   @override
   Future<Either<Failure, void>> call(int params) async {
       return await repository.delete(params);
   }
}
