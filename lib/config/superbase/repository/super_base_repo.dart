import 'package:the_food_hub_nsk_nig/config/superbase/interfaces/super_base_provider.dart';

class SuperBaseRepo {
  SuperBaseRepo({required this.provider});
  final SuperBase provider;

  Future<void> initialiseSuperbase() {
    return provider.superBaseInit();
  }
}
