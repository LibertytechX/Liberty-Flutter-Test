import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProjectListItem extends StatelessWidget {
  final ProjectModel project;
  final Function() onTap;
  
  const ProjectListItem({ 
    Key? key, 
    required this.project,
    required this.onTap 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final created = DateTime.parse(project.created);
    final end = DateTime.parse(project.end);

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              blurRadius: 14,
              offset: Offset(0, 0)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: CachedNetworkImage(
                      width: 38,
                      height: 38,
                      imageUrl: project.image ?? '',
                      errorWidget: (context, _, __) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            shape: BoxShape.circle
                          ),
                          child: Icon(
                            MdiIcons.imageOutline,
                            size: 18,
                          ),
                        );
                      },
                      placeholder: (context, _) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            shape: BoxShape.circle
                          ),
                          child: Icon(
                            MdiIcons.imageOutline,
                            size: 18,
                          ),
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: customTextNormal(
                      project.name,
                      alignment: TextAlign.start,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2
                      ),
                      child: customTextSmall(
                        '${DateTime.parse(project.end).difference(now).inDays}d',
                        textColor: Colors.white
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextSmall(
                        'Start',
                        fontWeight: FontWeight.w600,
                        textColor: Colors.greenAccent,
                        alignment: TextAlign.end
                      ),
                      customTextNormal(
                        '${created.day}-${created.month}-${created.year}',
                        fontSize: 14,
                        textColor: Colors.black54,
                        alignment: TextAlign.start
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextSmall(
                        'End',
                        fontWeight: FontWeight.w600,
                        textColor: Colors.redAccent,
                        alignment: TextAlign.end
                      ),
                      customTextNormal(
                        '${end.day}-${end.month}-${end.year}',
                        fontSize: 14,
                        textColor: Colors.black54,
                        alignment: TextAlign.start
                      )
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutePaths.createTaskPage,
                      arguments: project.id
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.primaryColor,
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8
                        ),
                        child: customTextSmall(
                          'Add Task',
                          textColor: AppColors.primaryColor
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}