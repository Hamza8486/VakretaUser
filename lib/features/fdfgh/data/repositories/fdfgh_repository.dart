import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';
import 'package:vkreta-/core/failures/failure.dart';
import 'package:vkreta-/features/fdfgh/data/data_sources/fdfgh_remote_data_source.dart';
import 'package:vkreta-/features/fdfgh/domain/repositories/fdfgh_repository_base.dart';
import 'package:dartz/dartz.dart';

class FdfghRepository extends FdfghRepositoryBase {
   FdfghRepository(super.remote);
   
   @override
   Future<Either<Failure,List<Fdfgh>>> getAll() async {
       try {
           return Right(await remote.getAll());
       } catch (e) {
           return Left(UnhandledFailure(message: e.toString()));
       }
   }
   
   @override
   Future<Either<Failure,Fdfgh>> getById(int id) async {
       try {
           return Right(await remote.getById(id));
       } catch (e) {
           return Left(UnhandledFailure(message: e.toString()));
       }
    }
    
   @override
   Future<Either<Failure,Fdfgh>> create(Fdfgh fdfgh) async {
       try {
           return Right(await remote.create(fdfgh));
       } catch (e) {
           return Left(UnhandledFailure(message: e.toString()));
       }
    }
    
   @override
   Future<Either<Failure,Fdfgh>> update(Fdfgh fdfgh) async {
       try {
           return Right(await remote.update(fdfgh));
       } catch (e) {
            return Left(UnhandledFailure(message: e.toString()));
       }
   }
   
   @override
   Future<Either<Failure,void>> delete(int id) async {
       try {
           return Right(await remote.delete(id));
       } catch (e) {
           return Left(UnhandledFailure(message: e.toString()));
       }
   }
   
   @override
   Future<Either<Failure,void>> deleteAll() async {
       try {
           return Right(await remote.deleteAll());
       } catch (e) {
           return Left(UnhandledFailure(message: e.toString()));
       }
    }
    
    
    
}
