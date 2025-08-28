import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../logic/address_logic/address_cubit.dart';
import 'map_preview.dart';

class AddressBuilder extends StatelessWidget {
  const AddressBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoaded) {
          return Column(
            children: [
              Text(state.address, style: Styles.font14GrayRegular),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                child: MapPreview(lat: state.latitude, lng: state.longitude),
              ),
            ],
          );
        }
        if (state is AddressLoading) {
          return const PrettyLoadingWidget();
        }
        if (state is AddressError) {
          return Text(state.message);
        }
        return Center(
          child: TextButton(
            onPressed: () {
              context.read<AddressCubit>().getUserAddress();
            },
            child: Text("Add Your Address"),
          ),
        );
      },
    );
  }
}
