import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfu/src/feature/profile/domain/entity/user.dart';

class ProfileBodyWidget extends StatelessWidget {
  final User user;

  const ProfileBodyWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5,
        ),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(radius: 30),
                title: Text(
                  '${user.firstName} ${user.lastName} ${user.fatherName ?? ''}',
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${user.institute} ${user.group}'),
                    Text('Номер студенческого:'),
                    Text('№${user.recordBookNumber}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/recordBook.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text('Зачетная книжка'),
                onTap: () { },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/list.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text('Список приказов'),
                onTap: () { },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: SvgPicture.asset(
                  'assets/images/event-schedule.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text('Учебный план'),
                onTap: () { },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text('Настройки'),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}