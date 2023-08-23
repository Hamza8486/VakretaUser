import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';
import 'package:vkreta-/features/fdfgh/domain/repositories/fdfgh_repository_base.dart';
import 'package:vkreta-/core/use_case/use_case_base.dart';
import 'package:vkreta-/core/use_case/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:vkreta-/core/failures/failure.dart';

class GetAllFdfghUseCase extends UseCaseBase<List<Fdfgh>, NoParams> {
   final FdfghRepositoryBase repository;
   
   GetAllFdfghUseCase(this.repository);
   
   @override
   Future<Either<Failure, List<Fdfgh>>> call(NoParams params) async {
       return await repository.getAll();
   }
}
