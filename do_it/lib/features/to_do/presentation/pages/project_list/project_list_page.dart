import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/to_do/presentation/pages/project_list/widgets/project_list_item.dart';
import 'package:do_it/features/to_do/presentation/providers/project_list_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({ Key? key }) : super(key: key);

  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<ProjectListPageProvider>(
      child: null,
      provider: ProjectListPageProvider(
        getProjects: Provider.of(context)
      ),
      builder: (context, provider, child) {
        if (provider.projects == null) {
          provider.initGetProjects();
        }
        
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0.0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
              Icons.arrow_back_ios
              )
            ),
            iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white : Colors.black,
            ),
            systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RoutePaths.createProjectPage
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.primaryColor,
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8
                        ),
                        child: customTextSmall(
                          'Create Projects',
                          textColor: AppColors.primaryColor
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: AppDimensions.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextExtraLarge(
                  'Projects',
                  alignment: TextAlign.start,
                  fontWeight: FontWeight.w600
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (provider.loading || provider.projects == null) {
                        return Center(child: CircularProgressIndicator.adaptive());
                      }

                      if (provider.projects!.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customTextMedium(
                                'Failed to get projects'
                              ),
                              TextButton(
                                onPressed: () => provider.initGetProjects(),
                                child: customTextNormal('Retry')
                              )
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: provider.projects!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ProjectListItem(
                            project: provider.projects![index],
                            onTap: () => Navigator.of(context).pushNamed(
                              RoutePaths.taskListPage,
                              arguments: provider.projects![index].id
                            )
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