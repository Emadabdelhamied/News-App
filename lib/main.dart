import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home_layout/homeLayout.dart';
import 'package:news_app/shared/component/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cacheHelper.dart';
import 'package:news_app/shared/network/remote/helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>NewsCubit()..changeAppMode(fromShared: isDark)..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
                scaffoldBackgroundColor: primaryBackground,
                appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                        color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                    backgroundColor: primaryBackground,
                    elevation: 0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: primaryBackground,
                      statusBarIconBrightness: Brightness.dark,
                    )),
                textTheme:TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                )
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: primarydarkBackground,
                appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white),
                    titleTextStyle: TextStyle(
                        color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    backgroundColor: primarydarkBackground,
                    elevation: 0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: primarydarkBackground,
                      statusBarIconBrightness: Brightness.light,
                    )),
                textTheme:TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                )
            ),

           themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: HomeLayout(),
          );
        },
      )
    );
  }
}
