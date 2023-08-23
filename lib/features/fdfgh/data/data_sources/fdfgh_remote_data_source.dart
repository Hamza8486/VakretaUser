import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';


abstract class FdfghRemoteDataSourceBase {
   final Dfgdgfh http;
       
   FdfghRemoteDataSourceBase(this.http);
       
   Future<List<Fdfgh>> getAll();
       
   Future<Fdfgh> getById(int id);
       
   Future<Fdfgh> create(Fdfgh fdfgh);
       
   Future<Fdfgh> update(Fdfgh fdfgh);
       
   Future<void> delete(int id);
       
   Future<void> deleteAll();
}

class FdfghRemoteDataSource extends FdfghRemoteDataSourceBase {
    FdfghRemoteDataSource(super.http);
       
    @override
    Future<List<Fdfgh>> getAll() async {
       // TODO implements
       throw UnimplementedError();
    }
    
    @override
    Future<Fdfgh> getById(int id) async {
       // TODO implements
       throw UnimplementedError();
    }
    
    @override
    Future<Fdfgh> create(Fdfgh fdfgh) async {
       // TODO implements
       throw UnimplementedError();
    }
    
    @override
    Future<Fdfgh> update(Fdfgh fdfgh) async {
        // TODO implements
       throw UnimplementedError();
    }
    
    @override
    Future<void> delete(int id) async {
        // TODO implements
       throw UnimplementedError();
    }
    
    @override
    Future<void> deleteAll() async {
        // TODO implements
       throw UnimplementedError();
    }
 

}