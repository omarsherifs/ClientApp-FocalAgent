import 'package:client_app_focal_agent/features/home/presentation/cubits/home_screen_cubit/homescreen_cubit.dart';
import 'package:client_app_focal_agent/features/home/presentation/widgets/empolyee_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HrListComponent extends StatefulWidget {
  const HrListComponent({super.key});

  @override
  State<HrListComponent> createState() => _HrListcomponentstate();
}

class _HrListcomponentstate extends State<HrListComponent> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    BlocProvider.of<HomeScreenCubit>(context).getHrEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeScreenCubit>(context);
        if (state is HomeScreenHrLoading) {
          return Center(
            child: Lottie.asset('assets/animation/loading_animation.json'),
          );
        }
        if (state is HomeScreenHrFailed) {
          return const Text('Something Went Wrong');
        }
        return RefreshIndicator(
          key: _refreshKey,
          color: Colors.white,
          backgroundColor: Colors.blue,
          strokeWidth: 4,
          onRefresh: () async {
            getData();
          },
          child: ListView.builder(
            itemCount: cubit.hrEmployeesList.length,
            itemBuilder: (BuildContext context, int index) {
              return EmployeeDataCard(
                employeeEntity: cubit.hrEmployeesList[index],
              );
            },
          ),
        );
      },
    );
  }
}
