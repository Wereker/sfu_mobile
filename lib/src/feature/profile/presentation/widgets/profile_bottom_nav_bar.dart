import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sfu/src/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:sfu/src/core/localization/app_localizations.dart';

class ProfileBottomNavBar extends StatelessWidget {
  const ProfileBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(
        12,
        0,
        12,
        MediaQuery.of(context).padding.bottom + 8,
      ),
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthEvent.logout());
        },
        child: Text(t!.profileLogout),
      ),
    );
  }

}