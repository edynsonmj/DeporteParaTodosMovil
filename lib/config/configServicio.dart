import 'package:movil/data/api/fabrica/ConexionFabricaAbstracta.dart';

class ConfigServicio {
  final String _ipLocal = "192.168.100.71";
  final String fakeServer =
      "https://41a5c51d-8572-4278-a147-e20426a0169e.mock.pstmn.io";

  static String tipoFabricaServicio = ConexionFabricaAbstracta.SERVICIO_REMOTO;
  static bool servicioFalso = false;
  static String? ip;

  String obtenerBaseApi() {
    if (servicioFalso) {
      return fakeServer;
    }
    ip ??= _ipLocal;
    if (ip!.isEmpty) {
      ip = _ipLocal;
    }
    return 'http://$ip:8082/api';
  }
}
