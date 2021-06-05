import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/colors/light_colors.dart';
import 'package:flutter_app/pageComponents/homePageComponents/active_project_card.dart';
import 'package:flutter_app/pageComponents/homePageComponents/task_column.dart';
import 'package:flutter_app/pageComponents/homePageComponents/top_container.dart';

class HomePage extends StatelessWidget {

  User? user = FirebaseAuth.instance.currentUser;

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 27.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today_outlined,
        size: 23.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      //backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 150,
              width: width,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              color: LightColors.kDarkYellow,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.menu,
                              color: LightColors.kDarkBlue, size: 30.0),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.search,
                              color: LightColors.kDarkBlue, size: 27.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'PIKU',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${user!.email}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Favorites'),
                              GestureDetector(
                                onTap: () {},
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'Announcements',
                            subtitle: 'College events and fee',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'Notice',
                            subtitle: 'college and university',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kBlue,
                            title: 'Results',
                            subtitle: 'Check you results',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Features'),
                          SizedBox(height: 5.0),
                          Row(
                          children: <Widget>[
                            ActiveProjectsCard(
                              cardColor: LightColors.kGreen,
                              title: 'Study Material',
                              subtitle: 'Books and Hand written Notes',
                              icon: Icons.map,
                            ),
                            SizedBox(width: 20.0),
                            ActiveProjectsCard(
                              cardColor: LightColors.kRed,
                              title: 'College Maps',
                              subtitle: 'Never get late for your classes',
                              icon: Icons.map,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            ActiveProjectsCard(
                              cardColor: LightColors.kDarkYellow,
                              title: 'Know yor faculties',
                              subtitle: 'Everything you need to know about your teachers',
                              icon: Icons.map,
                            ),
                            SizedBox(width: 20.0),
                            ActiveProjectsCard(
                              cardColor: LightColors.kBlue,
                              title: 'Clubs',
                              subtitle: 'All college clubs and events',
                              icon: Icons.map,
                            ),
                          ],
                              ),
                        ],
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
  }
}
