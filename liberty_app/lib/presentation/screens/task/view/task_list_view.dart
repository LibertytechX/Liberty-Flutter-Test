import 'package:flutter/material.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute<void>(builder: (_) => const TaskListScreen());
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return SliverAppScaffold(
      backIcon: AssetsSvg.backArrowIos(),
      bodyWidgets: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),

        /// Page Title
        SliverToBoxAdapter(
          child: Text(
            'Tasks',
            style: Theme.of(context).textTheme.headline2,
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
