import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0,left: 4,right: 4),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10.06),
            // boxShadow: kElevationToShadow[3]
            boxShadow:  const [
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Liberty Pay Loan App',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 15)),
                  SizedBox(
                    width: 53,
                    height: 28,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('4d',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: AppColors.white, fontSize: 12)),
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.purple),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.26,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Team members',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                        fontSize: 12,
                                        color: AppColors.darkGray)),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  const CircleAvatar(
                                    radius: 12,
                                  )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 21),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          RoundedIcon(
                            width: 15,
                            height: 15,
                            padding: const EdgeInsets.all(8),
                            icon: AssetsSvg.timeCalender(),
                            backgroundColor: AppColors.brown.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const FractionalOffset(0.19, 0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                      alignment: const FractionalOffset(0.54, 0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                      alignment: const FractionalOffset(0.92, 0.4),
                      child: CircularPercentIndicator(
                        radius: 34.0,
                        lineWidth: 4.0,
                        percent: 0.44,
                        center:  const Text("44%"),
                        progressColor: Colors.green,
                      ),
                    ),
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
