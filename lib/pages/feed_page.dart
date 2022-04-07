import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  static final String id = 'feed_page';

  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story('assets/images/user_1.jpeg', 'Jazmin'),
    Story('assets/images/user_2.jpeg', 'Sylvester'),
    Story('assets/images/user_3.jpeg', 'Lavina'),
    Story('assets/images/user_1.jpeg', 'Jazmin'),
    Story('assets/images/user_2.jpeg', 'Sylvester'),
    Story('assets/images/user_3.jpeg', 'Lavina'),
  ];

   List<Post> _posts = [
    Post(userImage:'assets/images/user_1.jpeg',
        userName:'Brianne',
        postImage:'assets/images/feed_1.jpeg',
        caption:'QWERTYUIO'),
     Post(userImage:'assets/images/user_2.jpeg',
         userName:'Brianne',
         postImage:'assets/images/feed_2.jpeg',
         caption:'QWERTYUIO'),
     Post(userImage:'assets/images/user_3.jpeg',
         userName:'Brianne',
         postImage:'assets/images/feed_3.jpeg',
         caption:'QWERTYUIO'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(

            child: Column(
              children: [
                Divider(),

                // # stories
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Stories',style: TextStyle(color: Colors.grey,fontSize: 14),),
                      Text('Watch all',style: TextStyle(color: Colors.grey,fontSize: 14))
                    ],
                  ),
                ),

                // #storyList
                Container(
                  width : MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    children: _stories.map((story){
                        return _itemOfStory(story);
                      }).toList(),
                  ),
                ),
                
                // # postList
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    itemBuilder: (ctx, i){
                      return _itemOFPost(_posts[i]);
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(70),
            border: Border.all(width:1),
            color: Colors.deepPurpleAccent),
          child: Container(
            padding: EdgeInsets.all(4),
            child: ClipOval(
                child: Image(image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text(story.name,style: TextStyle(color: Colors.grey),)
      ],
    );
  }

  Widget _itemOFPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children: [
          Row(
            children: [
              ClipOval(child: Image(image: AssetImage(post.userImage),
              height: 40,
              width: 40,),),
              SizedBox(width: 10,),
              Text(post.userName,style: TextStyle(color: Colors.grey),)
            ],
          ),
            Icon(Feather.more_horizontal,size: 30,color: Colors.grey,)

        ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),),
        Image(image: AssetImage(post.postImage)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(FontAwesome.heart_o,color: Colors.grey,)),
                IconButton(onPressed: (){}, icon: Icon(FontAwesome.comment_o,color: Colors.grey,)),
                IconButton(onPressed: (){}, icon: Icon(FontAwesome.send_o,color: Colors.grey,)),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Feather.bookmark),color: Colors.grey,)],
          ),

        // #tags
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: RichText(softWrap: true,
          overflow: TextOverflow.visible,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Liked by ",
                style: TextStyle(color: Colors.grey)
              ),
              TextSpan(
                  text: "Sigmund Yessenia ",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold)
              ),
              TextSpan(
                  text: "Dayana ",
                  style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold)
              ),
              TextSpan(
                  text: "and ",
                  style: TextStyle(color: Colors.grey,
                  //sfontWeight: FontWeight.bold
    ),),
                TextSpan(
                    text: "1263 others ",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold)
                ),
            ]

    ),),
          //
        ),
        // #caption
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
             text: TextSpan(
               children: [
                 TextSpan(
                     text: post.userName,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.white,

                     )
                 ),
                 TextSpan(
                     text:' ${post.caption}',
                     style: TextStyle(
                       color: Colors.grey,

                     )
                 )
               ]
             ),
            
          ),
        ),

        // #postDate
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.topLeft,
          child: Text('February 2020',style: TextStyle(color: Colors.grey),),
        )

      ],),
    );
  }
}
