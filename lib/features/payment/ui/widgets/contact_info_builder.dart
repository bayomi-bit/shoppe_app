import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theming/styles.dart';
import '../../logic/contact_info_logic/contact_info_cubit.dart';
import 'custom_text_field.dart';

class ContactInfoBuilder extends StatelessWidget {
  const ContactInfoBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactInfoCubit, ContactInfoState>(
      builder: (context, state) {
        final cubit = context.read<ContactInfoCubit>();
        if (state is ContactInfoLoaded) {
          return Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contact Information", style: Styles.font15BlackW500),
              CustomTextField(
                hintText: "Email",
                controller: cubit.emailController,
                icon: FontAwesomeIcons.envelope,
              ),
              CustomTextField(
                hintText: "Phone",
                controller: cubit.phoneController,
                icon: FontAwesomeIcons.phone,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
