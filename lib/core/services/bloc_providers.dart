import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:z_fashion/features/main_navigation/presentation/bloc/bottom_nav_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> get blocProviders => [
    BlocProvider<BottomNavCubit>(create: (_) => BottomNavCubit()),
  ];
}
