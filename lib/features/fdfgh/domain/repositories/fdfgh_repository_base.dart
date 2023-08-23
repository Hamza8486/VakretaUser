import 'package:vkreta-/features/fdfgh/data/data_sources/fdfgh_remote_data_source.dart';
import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';
import 'package:vkreta-/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FdfghRepositoryBase {
   final FdfghRemoteDataSourceBase remote;
   
   FdfghRepositoryBase(this.remote);
   
   Future<Either<Failure, List<Fdfgh>>> getAll();
   
   Future<Either<Failure, Fdfgh>> getById(int id);
   
   Future<Either<Failure, Fdfgh>> create(Fdfgh fdfgh);
   
   Future<Either<Failure, Fdfgh>> update(Fdfgh fdfgh);
   
   Future<Either<Failure, void>> delete(int id);
   
   Future<Either<Failure, void>> deleteAll();
}
