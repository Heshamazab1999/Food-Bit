import 'package:app/Controller/base_controller.dart';
import 'package:app/enum/enums.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class ProductController extends BaseController {
  Position _position = new Position();
  final _distance = 0.0.obs;
  final _now = DateTime.now().obs;
  RxBool _change = false.obs;

  DateTime get now => _now.value;

  Position get position => _position;

  double get distance => _distance.value;

  bool get change => _change.value;

  changes() {
    _change.value = !_change.value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await determinePosition();
    await getDistance();
    time();
    setSate(ViewState.idle);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  time() {
    print('timestamp: ${now.hour}:${now.minute}:${now.second}:');
  }

  Future<double> getDistance() async {
    try {
      final currentPosition = await determinePosition();
      print(currentPosition.latitude);
      double d = Geolocator.distanceBetween(position.latitude,
              position.longitude, 31.20384501928389, 29.88524201888047) *
          0.001;
      print("distance$d");
      _distance.value = d;
    } catch (e) {
      print(e);
      print('exception');
    }

    return 0;
  }
}
