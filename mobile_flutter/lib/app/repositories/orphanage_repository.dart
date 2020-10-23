import 'package:dio/dio.dart';
import 'package:happy/models/orphanage.dart';

class OrphanageRepository {
  final Dio dio;

  OrphanageRepository(this.dio);

  Future<List> getAllOrphanage() async {
    var response = await dio.get('/orphanages');
    List<Orphanage> list = [];
    print(response.data);
    for (var json in (response.data['result'] as List)) {
      Orphanage model = Orphanage(name: json['']);
      list.add(model);
      print(model);
    }

    return list;
  }
}
