import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webView.dart';
import 'package:news_app/shared/component/constants.dart';

Widget articleItem({@required article, @required context}) => InkWell(
  onTap: (){
    pushPage(context,WebviewScreen(article['url']));
  },
  child:   Padding(

        padding: const EdgeInsets.all(16.0),

        child: Row(

          children: [

            Container(

              width: 120,

              height: 120,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15),

                  image: DecorationImage(

                      image: NetworkImage('${article['urlToImage']}'),

                      fit: BoxFit.cover)),

            ),

            SizedBox(

              width: 20,

            ),

            Expanded(

              child: Container(

                height: 120,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(

                        child: Text(

                      '${article['title']}',

                      style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    )),

                    Text(

                      '${article['publishedAt']}',

                      style: TextStyle(color: Colors.deepOrange, fontSize: 16),

                    )

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
);

Widget articleBuilder(list,{isSearch=false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              articleItem(article: list[index], context: context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) => Center(
        child:isSearch? Container(child: Center(child: Icon(Icons.search,size: 250,color:Colors.grey ,),),)
            :CircularProgressIndicator(),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget form({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String hint,
  Function onChange,
  Function onTap,
  @required validate,
  @required String label,
  @required IconData prefix,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          decoration: new InputDecoration(
            prefixIcon: Icon(
              prefix,
              color: Colors.black,
            ),
            labelText: label,
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: primaryBackground,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.black26,
              ),
            ),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.black26,
              ),
            ),
          ),
          controller: controller,
          keyboardType: type,
          validator: validate,
          onTap: onTap,
          onChanged: onChange,
        ),
      ),
    );


pushPage(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}