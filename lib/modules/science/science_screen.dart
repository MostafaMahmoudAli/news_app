import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/shared/componants/componants.dart';
import 'package:news_flutter_app/shared/cubit/news_cubit.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener:(context,state){} ,
      builder:(context,state)
      {
        var list = NewsAppCubit.get(context).science;
        return ConditionalBuilder(
          condition:state is! NewsGetScienceLoadingState,
          builder:(context)=>ListView.separated(
            itemBuilder:(context,index)=>buildArticleItem(list[index],context,index),
            separatorBuilder:(context,index)=>myDivider(),
            itemCount:list.length,
          ),
          fallback:(context)=>Center(child: CircularProgressIndicator()),
        );
        },
    );
  }
}