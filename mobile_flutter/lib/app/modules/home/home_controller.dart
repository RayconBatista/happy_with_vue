import 'package:happy/app/repositories/orphanage_repository.dart';
import 'package:happy/models/orphanage.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final OrphanageRepository repository;

  @observable
  ObservableFuture<List<Orphanage>> orphanages;

  _HomeControllerBase(this.repository) {
    orphanages = repository.getAllOrphanage().asObservable();
  }
}
