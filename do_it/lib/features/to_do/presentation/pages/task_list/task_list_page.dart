import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/to_do/presentation/providers/task_list_page_provider.dart';
import 'package:do_it/features/to_do/presentation/widgets/task_item.dart';
import 'package:do_it/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatefulWidget {
  final String? projectId;
  
  const TaskListPage({ Key? key, required this.projectId }) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<TaskListPageProvider>(
      child: null,
      provider: TaskListPageProvider(
        getTasks: Provider.of(context)
      ),
      builder: (context, provider, child) {
        if (provider.tasks == null) {
          provider.initGetTasks(widget.projectId);
        }
        
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: Padding(
            padding: AppDimensions.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextExtraLarge(
                  'Tasks',
                  alignment: TextAlign.start,
                  fontWeight: FontWeight.w600
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (provider.loading || provider.tasks == null) {
                        return Center(child: CircularProgressIndicator.adaptive());
                      }

                      if (provider.tasks!.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customTextMedium(
                                'You have not added any tasks to this project'
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    RoutePaths.createTaskPage,
                                    arguments: widget.projectId
                                  );
                                },
                                child: customTextNormal('Add Task')
                              )
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: provider.tasks!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: TaskItem(
                            task: provider.tasks![index],
                          ),
                        ),
                      );
                    }
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}