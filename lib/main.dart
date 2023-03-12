import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/shared/cubit/news_cubit.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';
import 'package:news_flutter_app/shared/network/local/cache_helper.dart';
import 'package:news_flutter_app/shared/network/remote/dio_helper.dart';
import 'package:news_flutter_app/shared/style/themes.dart';
import 'layout/news_layout_screen.dart';
import 'shared/bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
 bool?isDark = CacheHelper.getBool(key:"isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget{
  final bool?isDark;
   MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsAppCubit()..getBusiness()..changeAppMode(
          fromShared:isDark
      ),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener:(context,state){},
        builder:(context,state)
        {
          return MaterialApp(
            home:NewsLayoutScreen(),
            debugShowCheckedModeBanner:false,
            theme:lightTheme,
            darkTheme:darkTheme,
            themeMode:NewsAppCubit.get(context).isDark?ThemeMode.light:ThemeMode.dark,
          );

        },
      ),
    );
  }
}



