import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfu/src/core/utils/qr_scanner.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return AppBar(
      centerTitle: true,
      leadingWidth: 72,
      titleSpacing: 0,

      leading: currentRoute != '/profile' && currentRoute != '/settings'
          ? Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 8.0,
                top: 10.0,
                bottom: 5.0
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(34),
                onTap: () => Navigator.pushNamed(context, '/profile'),
                child: const CircleAvatar(
                  radius: 24,
                ),
              ),
            )
          : null,

      title: SvgPicture.asset(
        'assets/images/logo_app_bar.svg',
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),

      actions: currentRoute != '/settings'
          ? [
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 8.0,
                  top: 10.0,
                  bottom: 5.0,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    final result = await QRScannerUtils.scan(context: context);
                    // Обработка результата
                  },
                  child: SvgPicture.asset(
                    'assets/images/QR.svg',
                    width: 36,
                    height: 36,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
