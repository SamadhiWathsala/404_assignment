import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width/20),
      child: SizedBox(
        height: size.height/7,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: size.height/32 + 2,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                  radius: size.height/32,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
              ),
            ),
            SizedBox(
              width: size.width/40,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hi,',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),
                  ),
                  Text('Peter John', style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w800,color: Colors.white),),
                ],
              ),
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_vert,color: Colors.white,size: size.height/20,)
            )
          ],
        ),
      ),
    );
  }
}