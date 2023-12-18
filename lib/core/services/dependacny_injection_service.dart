import 'package:client_app_focal_agent/features/home/data/data_sources/base_employees_data_source.dart';
import 'package:client_app_focal_agent/features/home/data/data_sources/remote_employees_data_source.dart';
import 'package:client_app_focal_agent/features/home/data/repositories/impl_list_hr_employee_repository.dart';
import 'package:client_app_focal_agent/features/home/data/repositories/impl_list_it_employee_repository.dart';
import 'package:client_app_focal_agent/features/home/domain/repositories/base_list_hr_employee_repository.dart';
import 'package:client_app_focal_agent/features/home/domain/repositories/base_list_it_employee_repository.dart';
import 'package:client_app_focal_agent/features/home/domain/use_cases/list_hr_employee_usecase.dart';
import 'package:client_app_focal_agent/features/home/domain/use_cases/list_it_employee_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  void init() {
    initHome();
  }

  void initHome() {
    // init Repositories
    sl
      ..registerLazySingleton<BaseListHrEmployeeRepository>(
        () => ImplListHrEmployeeRepository(sl()),
      )
      ..registerLazySingleton<BaseListItEmployeeRepository>(
        () => ImplListItEmployeeRepository(sl()),
      )
      // init Use Cases
      ..registerLazySingleton<ListHrDepartmentEmployeesUseCase>(
        () => ListHrDepartmentEmployeesUseCase(
          baseListHrEmployeeRepository: sl(),
        ),
      )
      ..registerLazySingleton<ListItDepartmentEmployeesUseCase>(
        () => ListItDepartmentEmployeesUseCase(
          baseListItEmployeeRepository: sl(),
        ),
      )

      // init Data Sources
      ..registerLazySingleton<BaseEmployeesDataSource>(
        RemoteEmployeesDataSource.new,
      );
  }
}
