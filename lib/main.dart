import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_food_hub_nsk_nig/config/superbase/provider/super_base_provoder_impl.dart';
import 'package:the_food_hub_nsk_nig/config/superbase/repository/super_base_repo.dart';
import 'package:the_food_hub_nsk_nig/features/auth/bloc/auth_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/providers/auth_provider_impl.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/repositories/auth_repository.dart';

void main() async {
  appInitialization();
  runApp(const MyApp());
}

appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final superBase = SuperBaseRepo(provider: SuperBaseProviderImpl());
  superBase.initialiseSuperbase();
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) =>
                AuthBloc(AuthRepository(provider: AuthProviderImpl())),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(textTheme: const TextTheme()),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: "/",
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
// 932400961744-cjk4r9kqjbgia1a75g3sq7ofh52oqh41.apps.googleusercontent.com

//932400961744-p7i2782qiu4kdvsnlc6p5u7qqs8gakld.apps.googleusercontent.com