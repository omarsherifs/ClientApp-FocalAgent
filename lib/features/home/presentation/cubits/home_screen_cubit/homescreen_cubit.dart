import 'package:bloc/bloc.dart';
import 'package:client_app_focal_agent/core/services/dependacny_injection_service.dart';
import 'package:client_app_focal_agent/features/home/domain/entity/base_employee_entity.dart';
import 'package:client_app_focal_agent/features/home/domain/use_cases/list_hr_employee_usecase.dart';
import 'package:client_app_focal_agent/features/home/domain/use_cases/list_it_employee_usecase.dart';
import 'package:equatable/equatable.dart';

part 'package:client_app_focal_agent/features/home/presentation/cubits/home_screen_cubit/homescreen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial()) {
    getHrEmployees();
  }
  List<BaseEmployeeEntity> hrEmployeesList = [];
  List<BaseEmployeeEntity> itEmployeesList = [];

  Future<void> getHrEmployees() async {
    emit(HomeScreenHrLoading());
    final result = await sl<ListHrDepartmentEmployeesUseCase>().call();
    result.fold((l) {
      hrEmployeesList = l;
      emit(HomeScreenHrSuccess());
    }, (r) {
      emit(HomeScreenHrFailed(r.message));
    });
  }

  Future<void> getITEmployees() async {
    emit(HomeScreenITLoading());
    final result = await sl<ListItDepartmentEmployeesUseCase>().call();
    result.fold((l) {
      itEmployeesList = l;
      emit(HomeScreenITSuccess());
    }, (r) {
      emit(HomeScreenITFailed(r.message));
    });
  }
}
