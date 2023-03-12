import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/shared/componants/componants.dart';
import 'package:news_flutter_app/shared/cubit/news_cubit.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener:(context,state){},
      builder:(context,state)
      {
        var list = NewsAppCubit.get(context).business;
        return ScreenTypeLayout(
          mobile:Builder(
            builder: (context) {

              NewsAppCubit.get(context).selectDesktop(false);

              return ConditionalBuilder(
                condition:state is! NewsGetBusinessLoadingState,
                builder:(context)=>ListView.separated(
                  physics:const BouncingScrollPhysics(),
                  itemBuilder:(context,index)=>buildArticleItem(list[index],context,index),
                  separatorBuilder:(context,index)=> myDivider(),
                  itemCount:list.length,
                ),
                fallback:(context)=>const Center(child:CircularProgressIndicator()),
              );
            }
          ),
          desktop:Builder(
            builder: (context) {

              NewsAppCubit.get(context).selectDesktop(true);

              return Row(
                children: [
                  Expanded(
                    child: ConditionalBuilder(
                      condition:state is! NewsGetBusinessLoadingState,
                      builder:(context)=>ListView.separated(
                        physics:const BouncingScrollPhysics(),
                        itemBuilder:(context,index)=>buildArticleItem(list[index],context,index),
                        separatorBuilder:(context,index)=> myDivider(),
                        itemCount:list.length,
                      ),
                      fallback:(context)=>const Center(child:CircularProgressIndicator()),
                    ),
                  ),
                if(list.isNotEmpty) Expanded(
                    child:Container(
                      height:double.infinity,
                      color:Colors.grey[300],
                      child: Text(
                        "${list[NewsAppCubit.get(context).selectBusinessItem]["description"]}",
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
          breakpoints:ScreenBreakpoints(
            desktop:600.0,
            tablet: 600.0,
            watch: 100.0,
          ),
        );
      }
    );
  }
}
