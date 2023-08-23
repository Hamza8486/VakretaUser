import 'package:vkreta-/features/fdfgh/domain/entities/fdfgh.dart';

class FdfghModel extends Fdfgh {
    FdfghModel({
       required id,
       required name,
    }) : super(id: id, name: name);
    
    factory FdfghModel.fromJson(Map<String, dynamic> json) {
       return FdfghModel(
           id: json['id'],
           name: json['name'],
       );
    }
    
    Map<String, dynamic> toJson() {
       return { 
           'id': id,
           'name': name,
       };
    }
}
