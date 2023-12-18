import 'package:client_app_focal_agent/features/home/presentation/components/hr_list_componant.dart';
import 'package:client_app_focal_agent/features/home/presentation/components/it_list_componant.dart';
import 'package:client_app_focal_agent/features/home/presentation/cubits/home_screen_cubit/homescreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HrListComponent(),
    const ITListComponent(),
  ];

  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {},
          builder: (context, state) {
            return pages[selectedIndex];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'hr',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'it',
          ),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
