import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../logic/address_logic/address_cubit.dart';

class MapPreview extends StatelessWidget {
  final double lat;
  final double lng;

  const MapPreview({super.key, required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: FlutterMap(
        options: MapOptions(center: LatLng(lat, lng), zoom: 13,
            onTap: (tapPosition, latLng) {
      context.read<AddressCubit>().selectAddressFromMap(latLng.latitude, latLng.longitude);
      },),

        children: [
          TileLayer(
            urlTemplate:
                "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=c8JknjZCaZGbGww4IvxP",
            userAgentPackageName: "com.example.app",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(lat, lng),
                width: 40.w,
                height: 40.h,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
