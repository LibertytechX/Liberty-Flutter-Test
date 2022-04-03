import 'package:flutter/material.dart';
import 'package:liberty_app/app/routes.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/screens/project/project.dart';
import 'package:liberty_app/presentation/screens/task/task.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void projectHandler() {
    Navigator.of(context).push(ProjectListScreen.route());
  }

  void taskHandler() {
    Navigator.of(context).push(TaskListScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppScaffold(
      fabHandler: () => Navigator.of(context).push(AddProjectScreen.route()),
      /// page Title
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi Dexter',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: AppColors.black)),
          Text(
            'Welcome onboard',
            style: Theme.of(context).textTheme.overline,
          ),
        ],
      ),

      /// page trailing [ Alert IconButton]
      trailingWidget: IconButton(
        onPressed: taskHandler,
        icon: AssetsSvg.notificationIcon(width: 30, height: 30),
      ),

      floatingIcon: Icons.add,

      /// body Widgets
      bodyWidgets: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),

        /// Home Grid List
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
          childAspectRatio: 1.05,
          children: [
            InkWell(
              onTap: projectHandler,
              child: HomeGridItem(
                icon: AssetsSvg.onboardMark(color: AppColors.white),
                title: 'Projects',
                count: 14,
                iconBackground: AppColors.brown,
              ),
            ),
            InkWell(
              onTap: taskHandler,
              child: HomeGridItem(
                icon: AssetsSvg.taskIcon(),
                title: 'Tasks',
                count: 4,
                iconBackground: AppColors.blue,
              ),
            ),
            InkWell(
              onTap: taskHandler,
              child: const HomeGridItem(
                icon: Icon(
                  Icons.check,
                ),
                title: 'Completed Task',
                count: 1,
                iconBackground: AppColors.green,
              ),
            ),
            InkWell(
              onTap: taskHandler,
              child: HomeGridItem(
                icon: AssetsSvg.overdueTask(),
                title: 'Overdue Task',
                count: 2,
                background: AppColors.gray.withOpacity(0.3),
                iconBackground: AppColors.gray,
              ),
            ),
          ],
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 20)),

        /// Task List Header
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Task in Progress',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: AppColors.black),
              ),
              TextButton(
                onPressed: taskHandler,
                child: Text(
                  'See all',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: AppColors.primary, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),

        /// Current Tasks
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              return InkWell(onTap: () {}, child: const TaskItem());
            },
            childCount: 10,
          ),
        )
      ],
    );
  }
}
