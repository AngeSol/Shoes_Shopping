import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoes_shopping/colors.dart';

import '../data.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> buildCategories(){
    return Data.generateCategories().map((e) => Container(
      padding: const EdgeInsets.only(left: 15,bottom: 10),
      child: ElevatedButton(
        onPressed: () {

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Text(e.title,
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),

        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(e.id == 1? Colors.white :MyColors.Black),
            backgroundColor: MaterialStateProperty.all<Color>(e.id == 1? Colors.white :MyColors.Orange),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
            )
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
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset("assets/img_banner.png"),
                ),

                Padding(
                    padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Nouveau",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
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
                           "Acheter maintenant".toUpperCase(),
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
          ),

          const SizedBox(height: 10,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
             child: RichText(
               textAlign: TextAlign.start,
               text: const TextSpan(
                   text: "Nouveau pour les hommes",
                   style: TextStyle(
                       color: Colors.black87,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold,
                   ),
               ),
             ),
          ),
          const SizedBox(height: 10,),

          GridView.count(
            childAspectRatio: 0.9,
            crossAxisCount: 2,
            padding: const EdgeInsets.all(5.0),
            children: Data.generateProducts().map((e) => Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
              elevation: 0,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: DetailScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(e.image,height: 90,width: double.infinity,),
                      const SizedBox(height: 5,),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: e.type,
                            style: const TextStyle(
                                color: MyColors.Orange,
                                fontSize: 16.0)),
                      ),
                      SizedBox(height: 5,),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: e.title,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0)),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: "\FCFA ${e.price}",
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Spacer(),
                          ElevatedButton(
                              child: const Icon(Icons.add,color: Colors.white,),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)))),
                              onPressed: () {})
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),).toList(),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          )
        ],
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked, //specify the location of the FAB
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.Orange,
          onPressed: () {
            print('OK');
          },
          tooltip: "start FAB",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.home_outlined, color: Colors.white,),
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 30,),

              IconButton(icon: Image.asset("assets/ic_shop.png"), onPressed: () {},),
              IconButton(icon: Image.asset("assets/ic_wishlist.png"), onPressed: () {},),
              IconButton(icon: Image.asset("assets/ic_notif.png"), onPressed: () {},),
              const SizedBox(width: 2,),
            ],
          ),
        )
    );
  }
}

