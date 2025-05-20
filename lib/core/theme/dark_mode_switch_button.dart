import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'manager/cubit/theme_cubit.dart';

class DarkModeSwitchButton extends StatelessWidget {
  const DarkModeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: const Icon(IconsaxPlusLinear.moon, size: 28),
      title: Text("Dark Mode", style: theme.textTheme.bodyMedium),
      trailing: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return Switch(
            value: state,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
          );
        },
      ),
    );
  }
}
