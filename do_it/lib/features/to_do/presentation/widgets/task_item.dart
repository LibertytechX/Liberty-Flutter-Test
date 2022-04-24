import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  
  const TaskItem({ Key? key, required this.task }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final created = DateTime.parse(task.created);
    final end = DateTime.parse(task.end);
    
    return Container(
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
                customTextNormal(
                  task.name,
                  alignment: TextAlign.start,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black54
                ),
                Spacer(),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2
                    ),
                    child: customTextSmall(
                      '${DateTime.parse(task.end).difference(now).inDays}d',
                      textColor: Colors.white
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            customTextSmall(
              'Team members',
              textColor: Colors.black45
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        child: Image.asset(
                          'asset/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      CircleAvatar(
                        radius: 12,
                        child: Image.asset(
                          'asset/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      CircleAvatar(
                        radius: 12,
                        child: Image.asset(
                          'asset/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                CircularPercentIndicator(
                  radius: 48.0,
                  lineWidth: 2.0,
                  percent: 0.4,
                  center: customTextSmall(
                    '40%',
                    fontWeight: FontWeight.w500
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  progressColor: Colors.green,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent.withOpacity(0.2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      MdiIcons.calendarMonthOutline,
                      color: Colors.redAccent.withOpacity(0.6),
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}