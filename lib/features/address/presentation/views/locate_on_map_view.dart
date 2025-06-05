import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/features/address/domain/repo/address_repo.dart';
import 'package:ionic/features/address/presentation/manager/add_or_edit_address/locate_on_map_cubit.dart';

import '../widgets/locate_on_map_widgets/custom_map.dart';
import '../widgets/locate_on_map_widgets/locate_on_map_confirm_button.dart';

class LocateOnMapView extends StatelessWidget {
  const LocateOnMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => LocateOnMapCubit(getIt<AddressRepo>()),
      child: BlocBuilder<LocateOnMapCubit, LocateOnMapState>(
        builder: (context, state) {
          final address = state.maybeWhen(
            success: (address, location) => address,
            error: (message) => message,
            orElse: () => "",
          );
          return Scaffold(
            appBar: AppBar(title: const Text("Locate on Map")),
            bottomNavigationBar: const SafeArea(
              child: LocateOnMapConfirmButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomMap(),
                  const SizedBox(height: 16),
                  state.isLoading
                      ? const LinearProgressIndicator()
                      : Text(address, style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
