import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/routing/routes.dart';
import 'package:shoppe/features/login/logic/login_cubit.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/custom_login_button.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/loading_widget.dart';

class LoginButtonBuilder extends StatelessWidget {
  const LoginButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const PrettyLoadingWidget();
        } else {
          return Column(
            children: [
              CustomLoginButton(
                onPressed: context.read<LoginCubit>().login,
                backgroundColor: ColorsManager.primaryColor,
                buttonText: 'login',
              ),
              CustomLoginButton(
                onPressed: () {
                  context.pop();
                },
                backgroundColor: ColorsManager.moreLightGray,
                buttonText: 'Cancel',
                textStyle: Styles.font18BlackNunito,
              ),
            ],
          );
        }
      },
      listener: (context, state) {
        if (state is LoginSuccess) {
          return DialogManager.showSuccessDialog(
            context: context,
            title: 'Success',
            description: "welcome ${state.loginResponseModel.firstName}",
            onPress: () => context.go(Routes.home),
          );
        }
        if (state is LoginError) {
          return DialogManager.showErrorDialog(
            context: context,
            title: 'Error',
            description: state.message,
            onPress: () {},
          );
        }
      },
    );
  }
}
