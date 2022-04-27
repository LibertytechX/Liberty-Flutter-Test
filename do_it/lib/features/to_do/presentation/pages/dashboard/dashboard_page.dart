import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/to_do/presentation/pages/dashboard/widgets/dashboard_card.dart';
import 'package:do_it/features/to_do/presentation/providers/dashboard_page_provider.dart';
import 'package:do_it/features/to_do/presentation/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return BasePage<DashboardPageProvider>(
      child: null,
      provider: DashboardPageProvider(
        getUserProfile: Provider.of(context),
        getProjects: Provider.of(context),
        getTasks: Provider.of(context)
      ),
      builder: (context, provider, child) {
        provider.init(context);
        if (provider.projects == null) {
          provider.initGetProjects();
        }
        if (provider.tasks == null) {
          provider.initGetTasks();
        }
        
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: AppDimensions.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customTextExtraLarge(
                        provider.userProfile == null
                        ? 'Hi'
                        : 'Hi ${provider.userProfile!.name}',
                        fontWeight: FontWeight.w600,
                        alignment: TextAlign.start
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {}, 
                        icon: Stack(
                          children: [
                            Icon(
                              MdiIcons.bellOutline
                            ),
                            Positioned(
                              right: 2,
                              top: 0,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red
                                ),
                              )
                            )
                          ],
                        )
                      )
                    ],
                  ),
                  customTextSmall(
                    'Welcome onboard',
                    textColor: AppColors.primaryColor
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if (provider.projects == null) return;
                            Navigator.of(context).pushNamed(
                              RoutePaths.projectListPage
                            );
                            provider.initGetProjects();
                          },
                          child: DashboardCard(
                            background: AppColors.orange.withOpacity(0.1),
                            color: AppColors.orange,
                            icon: MdiIcons.checkBold,
                            label: 'Projects',
                            value: provider.projects == null
                              ? 'N/A' : '${provider.projects!.length}',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await Navigator.of(context).pushNamed(
                              RoutePaths.taskListPage
                            );
                            provider.initGetTasks();
                          },
                          child: Expanded(
                            child: DashboardCard(
                              background: AppColors.primaryColor.withOpacity(0.1),
                              color: AppColors.primaryColor,
                              icon: MdiIcons.clipboardOutline,
                              label: 'Tasks',
                              value: provider.tasks == null
                                  ? 'N/A' : '${provider.tasks!.length}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DashboardCard(
                          background: AppColors.green.withOpacity(0.1),
                          color: AppColors.green,
                          icon: MdiIcons.checkBold,
                          label: 'Completed Tasks',
                          value: '0',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DashboardCard(
                          background: AppColors.grey.withOpacity(0.1),
                          color: AppColors.grey,
                          icon: MdiIcons.clipboardOffOutline,
                          label: 'Overdue Tasks',
                          value: provider.tasks == null
                              ? 'N/A' : '${provider.getOverdueTasks().length}',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 38),
                  Row(
                    children: [
                      customTextMedium(
                        'Tasks in Progress',
                        fontWeight: FontWeight.w600
                      ),
                      Spacer(),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RoutePaths.taskListPage
                          );
                        },
                        child: customTextNormal(
                          'See all',
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryColor
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (provider.tasks != null) ...List.generate(
                    provider.tasks!.length > 5 ? 5 : provider.tasks!.length, 
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: TaskItem(task: provider.tasks![index]),
                    )
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}