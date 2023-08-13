import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_food_hub_nsk_nig/config/superbase/interfaces/super_base_provider.dart';

class SuperBaseProviderImpl implements SuperBase {
  @override
  Future<void> superBaseInit() async {
    await Supabase.initialize(
      url: 'https://pknpkiqsukzmsfejsdot.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBrbnBraXFzdWt6bXNmZWpzZG90Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE5MTk5MDAsImV4cCI6MjAwNzQ5NTkwMH0.QavOHK_9FMwyMpTKNx8uBxeQttD7Sk5l5GGwl8I3YSc',
    );
  }
}
