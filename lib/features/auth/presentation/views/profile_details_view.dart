import 'package:flutter/material.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';

class ProfileDetailsView extends StatefulWidget {
  const ProfileDetailsView({super.key});
  static String id = 'ProfileDetailsView';

  @override
  State<ProfileDetailsView> createState() => _ProfileDetailsViewState();
}

class _ProfileDetailsViewState extends State<ProfileDetailsView> {
 String? email;

  @override
  void initState() {
    super.initState();
   // loadEmail();
  }

  // Future<void> loadEmail() async {
  //   String? storedEmail = await SharedPreference().getString('email');
  //   setState(() {
  //     email = storedEmail;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          // Center(
          //   child: CircleAvatar(
          //     radius: 100,
          //     backgroundColor: Colors.grey.withOpacity(.1),
          //     child: const CircleAvatar(
          //       backgroundImage: AssetImage('assets/Images/احذية.jpg',),
          //       radius: 80,
          //       child: Align(
          //         alignment: Alignment.bottomRight,
          //         child: Icon(Icons.image))
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20,),
          Container(
            child: Text(email!),
          )
        ],
      ),
    );
  }
}

// Container(

//               decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.all(Radius.circular(80))
//               ),
//             ),
