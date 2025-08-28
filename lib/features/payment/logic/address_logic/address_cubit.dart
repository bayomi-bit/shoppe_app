import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/location_service.dart';
import '../../data/rebo/payment_repository.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final PaymentRepository paymentRepository;

  AddressCubit(this.paymentRepository) : super(AddressInitial());

  Future<void> getUserAddress() async {
    try {
      emit(AddressLoading());

      final locationData = await LocationService().getCurrentLocation();
      final lat = locationData.latitude!;
      final lng = locationData.longitude!;

      final address = await paymentRepository.getAddressFromLocation(lat, lng);

      emit(AddressLoaded(address, lat, lng));
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }


  Future<void> selectAddressFromMap(double lat, double lng) async {
    try {
      emit(AddressLoading());

      final address = await paymentRepository.getAddressFromLocation(lat, lng);

      emit(AddressLoaded(address, lat, lng));
    } catch (e) {
      emit(AddressError(e.toString()));
    }
  }

}
