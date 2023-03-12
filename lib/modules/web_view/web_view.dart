import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter_app/shared/cubit/news_cubit.dart';
import 'package:news_flutter_app/shared/cubit/news_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

   final String? url;
  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener:(context,state){},
        builder:(context,state)
        {
          return Scaffold(
            appBar:AppBar(),
            body:WebView(
              initialUrl:url,
              javascriptMode:JavascriptMode.unrestricted,
            ),
          );
        },
       );
  }
}
