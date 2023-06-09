import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:clinic_app/app_const.dart';
import 'package:clinic_app/features/data/models/user_model.dart';
import 'package:clinic_app/features/presentation/cubit/user/user_cubit.dart';
import 'package:clinic_app/features/presentation/pages/home_page.dart';
import 'package:clinic_app/features/presentation/pages/messages_page.dart';
import 'package:clinic_app/features/presentation/pages/odp_page.dart';
import 'package:clinic_app/features/presentation/pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  final String uid;

  const HomeScreen({required Key key, required this.uid}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late UserModel user;
  late PageController _pageController;

  get pages => [
        HomePage(
          location: LatLng(37.419857, -122.078827),
          uid: widget.uid,
          key: UniqueKey(),
          mapType: MapType.satellite,
        ),
        // CoronaVirusPage(),
        MessagesPage(
          uid: widget.uid,
          key: UniqueKey(),
        ),
        ProfilePage(
          uid: widget.uid,
          key: UniqueKey(),
        ),
        if (user.accountType == AppConst.doctor)
          ODPPage(
            uid: widget.uid,
            key: UniqueKey(),
          ),
      ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    BlocProvider.of<UserCubit>(context).getAllUsers();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (ctx, userState) {
        if (userState is UserLoaded) {
          final user = userState.data.firstWhere(
              (user) => user.uid == widget.uid,
              orElse: () => UserModel(
                  accountType: '',
                  email: '',
                  isHide: '',
                  isOnline: true,
                  name: '',
                  profileUrl: '',
                  uid: ''));
          print(user.accountType);
          return Scaffold(
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: _selectedIndex,
              showElevation: true, //
              // use this to remove appBar's elevation
              onItemSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                  // _pageController.animateToPage(index,
                  //     duration: Duration(milliseconds: 300), curve: Curves.ease);
                });
              },
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: Colors.red,
                ),
                BottomNavyBarItem(
                    icon: SizedBox(
                        height: 28,
                        width: 28,
                        child: Image.asset('assets/corona.png')),
                    title: Text('Coronavirus'),
                    activeColor: Colors.pink),
                BottomNavyBarItem(
                    icon: Icon(Icons.message),
                    title: Text('Messages'),
                    activeColor: Colors.pink),
                BottomNavyBarItem(
                  icon: Icon(Icons.people),
                  title: Text('profile'),
                  activeColor: Colors.red,
                ),
                if (user.accountType == AppConst.doctor)
                  BottomNavyBarItem(
                    icon: Icon(Icons.local_hospital),
                    title: Text('OPD'),
                    activeColor: Colors.red,
                  ),
              ],
            ),
            body: _pageSwitcher(),
          );
        }
        return Scaffold(
          body: _loadingWidget(),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Setting up your account, Please Wait",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 30),
          SpinKitFadingCube(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _pageSwitcher() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      children: pages,
    );
  }
}
