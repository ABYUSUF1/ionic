import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/features/search/domain/repo/search_repo.dart';
import 'package:ionic/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:ionic/features/search/presentation/widgets/search_text_field.dart';

import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => SearchCubit(getIt<SearchRepo>()),
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: const SearchTextField(),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}
