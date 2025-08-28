import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/custom_login_button.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../logic/register_cubit.dart';
class RegisterButtonBuilder extends StatelessWidget {
  const RegisterButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const PrettyLoadingWidget();
        } else {
          return Column(
            children: [
              CustomLoginButton(
                onPressed: context.read<RegisterCubit>().register,
                backgroundColor: ColorsManager.primaryColor,
                buttonText: 'Done',
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
        if (state is RegisterSuccess) {
          return DialogManager.showSuccessDialog(
            context: context,
            title: 'Success',
            description: "welcome ${state.registerResponseModel.firstName}",
            onPress: () => Navigator.pop(context),
          );
        }
        if (state is RegisterError) {
          return DialogManager.showErrorDialog(
            context: context,
            title: 'Error',
            description: state.message,
            onPress: () => Navigator.pop(context),
          );
        }
      },
    );
  }
}
