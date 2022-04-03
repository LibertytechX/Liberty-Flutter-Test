import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/screens/project/project.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

import '../../../../app/routes.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute<void>(builder: (_) => const ProjectListScreen());
  @override
  _ProjectListScreenState createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {

  void createProjectHandler() {
    Navigator.of(context).push(AddProjectScreen.route());
  }

  void addTaskHandler() {
    Navigator.of(context).push(AddTaskScreen.route());
  }


  @override
  Widget build(BuildContext context) {
    return SliverAppScaffold(
      backIcon: AssetsSvg.backArrowIos(),
      trailingWidget: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 30.0, horizontal: AppSizes.appSideGap * 0.6),
        child: TextButton(
          onPressed: createProjectHandler,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: AppColors.primary))),
          child: Text('Create Project',
              style: Theme
                  .of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontSize: 12, color: AppColors.primary)),
        ),
      ),
      bodyWidgets: [
        SliverToBoxAdapter(
          child: Text(
            'Projects',
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(
            height: 21,
          ),
        ),

        /// Current Tasks
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (ctx, index) {
              return InkWell(
                onTap: () {},
                child: ProjectItem(addTaskHandler: addTaskHandler,),
              );
            },
            childCount: 10,
          ),
        )
      ],
    );
  }

}
