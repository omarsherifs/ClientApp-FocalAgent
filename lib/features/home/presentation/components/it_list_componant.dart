import 'package:client_app_focal_agent/features/home/presentation/cubits/home_screen_cubit/homescreen_cubit.dart';
import 'package:client_app_focal_agent/features/home/presentation/widgets/empolyee_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ITListComponent extends StatefulWidget {
  const ITListComponent({super.key});

  @override
  State<ITListComponent> createState() => _ITListcomponentstate();
}

class _ITListcomponentstate extends State<ITListComponent> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenCubit>(context).getITEmployees();
  }

  void getData() {
    BlocProvider.of<HomeScreenCubit>(context).getITEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeScreenCubit>(context);
        if (state is HomeScreenITLoading) {
          return Center(
            child: Lottie.asset('assets/animation/loading_animation.json'),
          );
        }
        if (state is HomeScreenITFailed) {
          return const Text('Something Went Wrong');
        }
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          color: Colors.white,
          backgroundColor: Colors.blue,
          strokeWidth: 4,
          onRefresh: () async {
            getData();
          },
          child: ListView.builder(
            itemCount: cubit.itEmployeesList.length,
            itemBuilder: (BuildContext context, int index) {
              return EmployeeDataCard(
                employeeEntity: cubit.itEmployeesList[index],
              );
            },
          ),
        );
      },
    );
  }
}
