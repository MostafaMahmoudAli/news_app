import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/modules/business/business_screen.dart';
import 'package:news_flutter_app/modules/science/science_screen.dart';
import 'package:news_flutter_app/modules/sports/sports_screen.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';
import 'package:news_flutter_app/shared/network/local/cache_helper.dart';
import 'package:news_flutter_app/shared/network/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates>
{
  NewsAppCubit():super(NewsAppInitialState());

  static NewsAppCubit get(context)=>BlocProvider.of(context);

  int currentIndex =0;

  List<BottomNavigationBarItem>bottomNavigationBarItem=[
    BottomNavigationBarItem(
  icon:Icon(
      Icons.business_center_outlined,
      ),
      label:"business",
  ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports,
      ),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science_outlined,
      ),
      label: "Science",
    ),
  ];
  List<Widget>screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(index)
  {
    currentIndex = index;
    if(index==1)
    {
      getSports();
    }if(index==2)
    {
      getScience();
    }
    emit(NewsAppNavBarState());
  }

  List<dynamic>business=[];

  List<bool>businessSelectedItem=[];

  int selectBusinessItem=0;

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"business",
          "apiKey":"457457d8388c40dfb67a73842dfc32d6",
        }).then((value)
    {

      business=value.data["articles"];
      business.forEach((element)
      {
        businessSelectedItem.add(false);
      });
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  bool isDesktop = false;

  void selectDesktop(bool value)
  {
    isDesktop = value;
    emit(NewsSelectDesktopState());
  }

  void selectedBusinessItem(int index)
  {

     selectBusinessItem =index;
    // for(int i = 0; i < businessSelectedItem.length; i ++)
    // {
    //   if(i == index)
    //   {
    //     businessSelectedItem[i]=true;
    //   }else
    //   {
    //     businessSelectedItem[i]=false;
    //   }
    // }
    emit(NewsSelectedBusinessItemState());
  }

  List<dynamic>sports=[];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          "country":"eg",
          "category":"sports",
          "apiKey":"457457d8388c40dfb67a73842dfc32d6",
        }).then((value)
    {
       sports=value.data["articles"];
       emit(NewsGetSportsSuccessState());
    }).catchError((error)
    {
      emit(NewsGetSportsErrorState(error));
    });
  }

  List<dynamic>science=[];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url:"v2/top-headlines",
        query:{
           "country":"eg",
           "category":"science",
           "apiKey":"457457d8388c40dfb67a73842dfc32d6",
        }).then((value)
    {
      science=value.data["articles"];
      emit(NewsGetScienceSuccessState());
    }).catchError((error)
    {
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

bool isDark = false;

  void changeAppMode({bool?fromShared})
  {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsAppModeChangeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBool(key: "isDark", value: isDark).then((value) {
        emit(NewsAppModeChangeState());
      });
    }
  }
    List<dynamic>search=[];

    void getSearch(String value)
    {
      emit(NewsGetSearchLoadingState());
      DioHelper.getData(
          url: "v2/everything",
          query:{
            "q":"$value",
            "apiKey":"457457d8388c40dfb67a73842dfc32d6",
          }).then((value)
      {
        search=value.data["articles"];
        emit(NewsGetSearchSuccessState());
      }).catchError((error)
      {
        emit(NewsGetSearchErrorState(error.toString()));
      });
    }


}
