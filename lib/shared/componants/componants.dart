import 'package:flutter/material.dart';
import 'package:news_flutter_app/modules/web_view/web_view.dart';
import '../cubit/news_cubit.dart';

Widget buildArticleItem(article,context,index)=>Container(

  color:NewsAppCubit.get(context).selectBusinessItem==index&&NewsAppCubit.get(context).isDesktop? Colors.grey[300] : null,
  child:InkWell(
    onTap:()
    {
      // navigateTo(context,WebViewScreen(article["url"]));
      NewsAppCubit.get(context).selectedBusinessItem(index);
    },

    child:Row(
    children:[
    Padding(
    padding:const EdgeInsets.all(20.0),
    child: Container(
      width:120.0,
      height:120.0,
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(10.0),
    image:DecorationImage(
    image:NetworkImage("${article["urlToImage"]}"),
    fit:BoxFit.cover,
    ),
    ),
    ),
    ),
     SizedBox(
    width: 20.0,
    ),
      Expanded(
    child: Container(
    height:130.0,
    child: Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    mainAxisAlignment:MainAxisAlignment.start,
    children:[
    Text(
      "${article["title"]}",
    maxLines:3,
    overflow:TextOverflow.ellipsis,
    style:Theme.of(context).textTheme.headline6,
    ),
    SizedBox(
    height:8.0,
    ),
    Text(
      "${article["publishedAt"]}",
      maxLines:1,
      overflow:TextOverflow.ellipsis,
    style:TextStyle(
    color: Colors.grey,
    fontSize:16.0,

    fontWeight:FontWeight.bold,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
  ),
);

Widget myDivider()=>Padding(
  padding:  EdgeInsets.symmetric(horizontal:10.0),
  child:   Container(

    width:double.infinity,

    height:1.0,

    color:Colors.grey[800],

  ),
);

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  Function(String value)?function,
  Function()?onTap,
  ValueChanged <String> ?onChanged,
  required FormFieldValidator<String>validator,
  required  IconData? prefix,
  required String text,
  bool isPassword = false,
  IconData ?suffix,
  Function()?onPressed,
}
    )
=>
    TextFormField(
      onTap:onTap,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: function ,
      onChanged:onChanged,
      validator:validator,
      obscureText:  isPassword,
      decoration: InputDecoration(
        labelText:text,
        border: OutlineInputBorder(),
        prefixIcon:  Icon(
          prefix,
        ),
        suffixIcon:IconButton(
          onPressed:onPressed,
          icon: Icon(
            suffix,
          ),
        ) ,

      ),
    ) ;

void navigateTo(context,widget)=> Navigator.push(
  context,
  MaterialPageRoute(
      builder:(context)=>widget
  ),
);
