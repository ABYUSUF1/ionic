import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/widgets/buttons/custom_filled_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../manager/locate_on_map/locate_on_map_cubit.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.watch<LocateOnMapCubit>();
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FlutterMap(
              mapController: cubit.mapController,
              options: MapOptions(
                initialCenter: const LatLng(30, 31), // Cairo
                initialZoom: 9.2,
                minZoom: 3.0,
                maxZoom: 19.0,
                backgroundColor: theme.colorScheme.surface,
              ),
              children: [
                TileLayer(
                  // Url Template show the map and without it you can't see the map
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.ionic',
                  // for more performance
                  tileProvider: CancellableNetworkTileProvider(),
                ),
              ],
            ),
          ),

          // Center marker
          const Center(
            child: Icon(Icons.location_pin, size: 40, color: Colors.red),
          ),

          // Locate Me Button
          Positioned(
            bottom: 30,
            right: 16,
            child: ZoomIn(
              animate: !cubit.state.isLoading,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              child: SizedBox(
                height: 55,
                width: 150,
                child: CustomFilledButton(
                  text: context.tr(LocaleKeys.address_locate_me),
                  icon: IconsaxPlusBold.gps,
                  onPressed: () async {
                    await cubit.getLocationAndAddress();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
