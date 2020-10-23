// ignore: implementation_imports
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:happy/app/app_widget.dart';
import 'package:happy/app/modules/home/home_controller.dart';
import 'package:happy/app/modules/home/home_page.dart';
import 'package:happy/app/repositories/orphanage_repository.dart';
import 'package:happy/utils/constants.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<OrphanageRepository>())),
    Bind((i) => OrphanageRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
  ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        // ModularRouter('/homepage', child: (_, args) => HomePage())
      ];

  @override
  Widget get bootstrap => AppWidget();
}
