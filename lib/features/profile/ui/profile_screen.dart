import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppe/core/widget/app_text_form_field.dart';
import 'package:shoppe/features/profile/logic/profile_cubit.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widget/back_ic_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

        return Scaffold(
          backgroundColor: ColorsManager.backgroundColor,
          appBar: AppBar(
            title: Text(
              "Profile",
              style: Styles.font15BlackW500.copyWith(fontSize: 18.sp),
            ),
            leading: IconButton(
              icon: const BackIcAppBar(),
              onPressed: () {
                context.pop();
              },
            ),
            centerTitle: true,
            backgroundColor: ColorsManager.backgroundColor,

            actions: [
              IconButton(
                onPressed: () {
                  if (state.isReadOnly) {
                    context.read<ProfileCubit>().toggleEdit();
                  } else {
                    context.read<ProfileCubit>().saveProfile();
                  }
                },
                icon: state.isReadOnly
                    ? const Icon(
                        FontAwesomeIcons.penToSquare,
                        color: ColorsManager.blue,
                      )
                    : const Icon(
                        FontAwesomeIcons.check,
                        color: ColorsManager.black,
                      ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: ColorsManager.white,
                      child: Icon(Icons.person, size: 80),
                    ),
                  ),
                  Center(
                    child: Text(
                      cubit.nameController.text,
                      style: Styles.font15BlackW500,
                    ),
                  ),

                  verticalSpace(40),
                  Text("Full Name", style: Styles.font15BlackW500),
                  AppTextFormField(
                    hintText: cubit.nameController.text,
                    controller: cubit.nameController,
                    readOnly: state.isReadOnly,
                    validator: (value) {},
                  ),
                  verticalSpace(15),
                  Text("Email", style: Styles.font15BlackW500),
                  AppTextFormField(
                    hintText: cubit.emailController.text,
                    validator: (value) {},
                    controller: cubit.emailController,
                    readOnly: state.isReadOnly,
                  ),
                  verticalSpace(15),

                  Text("Phone Number", style: Styles.font15BlackW500),
                  AppTextFormField(
                    hintText: cubit.phoneController.text,
                    controller: cubit.phoneController,
                    textInputType: TextInputType.phone,
                    readOnly: state.isReadOnly,

                    validator: (value) {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
