import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/config/app_theme.dart';
import 'package:flutter_application_pc_1/pages/album_page.dart';
import 'package:flutter_application_pc_1/pages/login_page.dart';
import 'package:flutter_application_pc_1/pages/mv_play_page.dart';
import 'package:flutter_application_pc_1/pages/root_page.dart';
import 'package:flutter_application_pc_1/pages/search_list_page.dart';
import 'package:flutter_application_pc_1/pages/singer_detail_page.dart';
import 'package:flutter_application_pc_1/pages/song_list_page.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:flutter_application_pc_1/state_model/use_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/transit_page.dart';
import 'package:dio/dio.dart';

/// More examples see https://github.com/flutterchina/dio/tree/master/example

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserModel_Provider()),
    ChangeNotifierProvider(create: (_) => AudioPlayerModel_Provider()),
  ], child: const MyApp()));
  SharedPreferences.setMockInitialValues(
      {}); // set initial values here if desired
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuoMu',
      theme: themeData,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          print(settings.name!);
          switch (settings.name) {
            case '/root':
              print(Provider.of<UserModel_Provider>(context, listen: false)
                  .is_login);
              if (Provider.of<UserModel_Provider>(context, listen: false)
                  .is_login) {
                return RootPage();
              } else {
                return LoginPage();
              }
            case '/mv':
              return MvPlayPage(arguments: settings.arguments);
            case '/songlist':
              return SongListPage(arguments: settings.arguments);
            case '/album':
              return AlbumPage(arguments: settings.arguments);
            case '/login':
              return LoginPage();
            case '/search':
              return SearchListPage();
            case '/singer_detail':
              return SingerDetailPage(arguments: settings.arguments);

            default:
              return LoginPage();
          }
        });
      },
      debugShowCheckedModeBanner: false,
      home: TransitPage(),
    );
  }
}
