import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<CategoryDetail> categoriesDetail = [
      CategoryDetail(Icons.menu_book_outlined, Colors.greenAccent),
      CategoryDetail(Icons.radio, Colors.purpleAccent),
      CategoryDetail(Icons.computer_outlined, Colors.amberAccent),
      CategoryDetail(Icons.location_on_outlined, Colors.pinkAccent),
    ];
    return SizedBox(
      width: size.width,
      height: size.height/5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width/30),
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesDetail.length,
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width/40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(size.width/35)
                    ),
                    color: categoriesDetail[index].color,
                  ),
                  width: size.width/3,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width/50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(categoriesDetail[index].icon,color: Colors.white,size: size.width/12,),
                        const Expanded(
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
                            ,style: TextStyle(color: Colors.white),
                            )
                        ),
                        const Icon(Icons.add,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              );
            }
        )
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetail{
  final Color color;
  final IconData icon;

  CategoryDetail(this.icon,this.color);
}