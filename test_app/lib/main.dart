import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_app/blocs/authentication/authentication_cubit.dart';
import 'package:test_app/spin_wheel.dart';
import 'package:test_app/views/splash/login.dart';
import 'package:ui_lib/styles/app_theme.dart';
import 'package:test_app/values/app_routes.dart' as testAppRoute;

//TODO

void main() {
  runApp(ModularApp(module: MyModule(), child: MyApp()));
}

class MyModule extends Module {
  @override
  // TODO: implement imports

  @override
  List<Bind<Object>> get binds => [
        // Bind.singleton<VGStringProvider>((i) => VGStringProvider.instance),
        // Bind.singleton<ResourceProvider>((i) => ResourceManagerImpl.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const Login()),
        ChildRoute(testAppRoute.AppRoutes.spinWheel,
            child: (context, args) => const SpinWheel()),
      ];
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationCubit>(
              create: (context) => AuthenticationCubit()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: VGAppTheme.defaultThemeData,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ));
  }

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addObserver(this);
  //   super.initState();
  //   initResourceBundleConfig();
  // }

  // Future<void> initResourceBundleConfig() async {
  //   /// Retrieve the device's locale setting
  //   /// Platform.localeName returns the language code as well as the country code.
  //   /// We will split the value and use only the language code

  //   String languageCode = Platform.localeName.split('_')[0];

  //   var resourceConfig =
  //       ResourceConfig(tenant: "9998", locale: languageCode, groupId: "44896");
  //   await Modular.get<ResourceProvider>().initConfig(resourceConfig,
  //       callback: () {
  //     setState(() {
  //       print('Done downloading resources');
  //     });
  //   });
  // }
}
