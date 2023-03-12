import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/shared/componants/componants.dart';
import 'package:news_flutter_app/shared/cubit/news_cubit.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener:(context,state){},
      builder:(context,state)
      {
        var list =NewsAppCubit.get(context).search;
        return Scaffold(
          appBar:AppBar(),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defultFormField(
                  controller: searchController,
                  keyboardType:TextInputType.text,
                  validator:(String?value)
                  {
                    if(value!.isEmpty)
                    {
                      return "Search Must Not be empty";
                    }
                    return null;
                  },
                  onChanged:(value)
                  {
                    NewsAppCubit.get(context).getSearch(value);
                  },
                  prefix:Icons.search_rounded,
                  text: "Search",
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! NewsGetSearchLoadingState,
                  builder:(context)=>ListView.separated(
                    itemBuilder:(context,index)=>buildArticleItem(list[index], context,index),
                    separatorBuilder:(context,index)=>myDivider(),
                    itemCount:list.length,
                  ),
                  fallback:(context)=>const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          )
        );
      },
    );
  }
}
