import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiz_twk/bloc/config_bloc.dart';
import 'package:quiz_twk/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConfigBloc>(
          create: (context) => ConfigBloc(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MainPage()),
          GetPage(name: '/level', page: () => LevelPage()),
          GetPage(
              name: '/question/:indexLevel/:indexQuestion',
              page: () => QuestionPage()),
          GetPage(
              name: '/description/:indexLevel/:indexQuestion',
              page: () => DescriptionPage()),
          GetPage(name: '/questions/:level', page: () => QuestionListPage()),
          GetPage(name: '/answer', page: () => MainPage()),
          GetPage(name: '/finish', page: () => MainPage()),
        ],
      ),
    );
  }
}
