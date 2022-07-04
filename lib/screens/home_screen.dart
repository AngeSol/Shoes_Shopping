import 'package:flutter/material.dart';
import 'package:shoes_shopping/colors.dart';

import '../data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Iterable<Container> buildCategories(){
    return Data.generateCategories().map((e) => Container(
      padding: EdgeInsets.only(left: 15,bottom: 10),
      child: ElevatedButton(
        onPressed: () {

        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color:MyColors.Black,
                child: Image.asset(e.image),
              ),
            ),
            SizedBox(width: 10,),
            Text(e.title,style: TextStyle(fontSize: 14,),)
          ],
        ),
      ),

    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("assets/ic_menu.png"),
          onPressed: () {  },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Image.asset("assets/ic_search.png")
        ],
      ),

      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(15),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset("assets/img_banner.png"),
                  borderRadius: BorderRadius.circular(14),
                ),

                Padding(
                    padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "New Release",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              )
                          )
                      ),

                      const SizedBox(height: 5,),

                      RichText(
                        textAlign: TextAlign.start,
                          text: const TextSpan(
                            text: "Nike Air\nMax 90",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28,
                            )

                          )
                      ),

                      const SizedBox(height: 5,),

                     ElevatedButton(
                         onPressed: () { },
                       style: ButtonStyle(
                         foregroundColor: MaterialStateProperty.all<Color>(MyColors.Black),
                         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                         )
                       ), 
                         child: Text(
                           "Buy Now".toUpperCase(),
                         ),
                     ),
                      
                      
                    ],
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: buildCategories(),
            ),
          )
        ],
      ),

    );
  }
}
