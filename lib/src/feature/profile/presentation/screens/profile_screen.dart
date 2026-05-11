import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfu/src/app/dependency_injection/injection.dart';
import 'package:sfu/src/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_body.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_skeleton.dart';
import 'package:sfu/src/feature/profile/presentation/widgets/profile_error_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileBloc>()..add(const ProfileEvent.loadData()),
      child: const Scaffold(body: _ProfileContent()),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) => state.when(
        initial: () => const ProfileSkeleton(),
        loading: () => const ProfileSkeleton(),
        success: (user) => ProfileBody(user: user),
        error:   (msg)  => ProfileErrorView(message: msg),
      ),
    );
  }
}