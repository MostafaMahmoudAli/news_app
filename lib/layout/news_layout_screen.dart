import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/modules/search/search_screen.dart';
import 'package:news_flutter_app/shared/componants/componants.dart';
import 'package:news_flutter_app/shared/cubit/news_cubit.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';

class NewsLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text(
              "NewsApp",
            ),
            actions: [
              IconButton(
                  onPressed:()
                  {
                    navigateTo(context,SearchScreen(),);
                  },
                  icon:Icon(
                    Icons.search_rounded,
                  )
              ),
              IconButton(
                  onPressed:()
                  {
                    NewsAppCubit.get(context).changeAppMode();
                  },
                  icon:Icon(
                    Icons.brightness_4_outlined,
                  )
              ),
            ],
          ),
          bottomNavigationBar:BottomNavigationBar(
            onTap:(index)
            {
              cubit.changeBottomNavBar(index);
            },
            items:cubit.bottomNavigationBarItem,
            currentIndex:cubit.currentIndex,
          ),
          body:cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
