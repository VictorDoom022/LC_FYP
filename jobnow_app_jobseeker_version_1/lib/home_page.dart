
import 'package:flutter/material.dart';

import 'jobseeker_screen/apply_job_screen/job_status.dart';
import 'jobseeker_screen/apply_job_screen/jobs.dart';
import 'jobseeker_screen/conversation_screen/chat_room.dart';
import 'jobseeker_screen/login_logout_screen/jobseeker_login.dart';


Widget cardViewJob(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobsPage(),
          )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.find_in_page,
            color: Colors.black,
            size: 100,
          ),
          Text('Find Job',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    ),
  );
}

Widget cardWorkStatus(context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobStatus(),
          )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book_online,
            color: Colors.black,
            size: 100,
          ),
          Text('Job Status Update',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    ),
  );
}

Widget cardChat(context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobseekerChatRoom(),
          )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            color: Colors.black,
            size: 100,
          ),
          Text('Conversation Room',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    ),
  );
}

Widget cardLogout(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => JobseekerLogin(),
          )
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Colors.black,
            size: 100,
          ),
          Text('Logout',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    ),
  );
}

class JobseekerHome extends StatelessWidget {
  const JobseekerHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFAB47BC),
                    Color(0xFFE1BEE7),
                    Color(0xFFE1BEE7),
                    Color(0xFFAB47BC),
                  ]
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Jobseeker ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        cardViewJob(context),
                        cardWorkStatus(context),
                        cardChat(context),
                        cardLogout(context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}