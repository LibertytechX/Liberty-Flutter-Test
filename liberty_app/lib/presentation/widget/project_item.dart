import 'package:flutter/material.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../app/theme.dart';
import 'common/rounded_icon.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({Key? key, this.addTaskHandler}) : super(key: key);

  final Function()? addTaskHandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10.06),
            // boxShadow: kElevationToShadow[3]
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowGrey,
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              ),
            ]),
        // elevation: 4,
        // borderRadius: BorderRadius.circular(10.06),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  backgroundImage: NetworkImage(''),
                ),
                minLeadingWidth: 23,
                contentPadding: EdgeInsets.zero,
                title: Text('Liberty Pay',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 15)),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 53,
                    height: 25,
                    child: TextButton(
                      onPressed: addTaskHandler,
                      child: Text('4d',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: AppColors.white, fontSize: 10)),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 40,
                child: Stack(
                  children: [
                    Align(
                      alignment: const FractionalOffset(0.0, 0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(
                                      color: AppColors.red, fontSize: 9)),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '27-3-2022',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(
                                    color: AppColors.black, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const FractionalOffset(0.4, 0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(
                                      color: AppColors.green, fontSize: 9)),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '27-3-2022',
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(
                                    color: AppColors.black, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const FractionalOffset(0.99, 0.6),
                      child: SizedBox(
                        height: 29,
                        width: 80,
                        child: TextButton(
                          onPressed: addTaskHandler,
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(
                                      color: AppColors.primary))),
                          child: Text('Add Task',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      fontSize: 12, color: AppColors.primary)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
