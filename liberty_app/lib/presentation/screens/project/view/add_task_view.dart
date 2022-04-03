import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static route() =>
      MaterialPageRoute<void>(builder: (_) => const AddTaskScreen());
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var inputDecorationTheme = Theme.of(context).inputDecorationTheme;
    return SliverAppScaffold(
      backIcon: AssetsSvg.backArrowIos(),
      bodyWidgets: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),

        /// Page Title
        SliverToBoxAdapter(
          child: Text(
            'Create Project',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),

        /// Project form
        Form(
          child: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                const UnderLinedTextFormField(
                  label: Text('Task Name'),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DateFormPicker(
                          label: 'Created (from)',
                          selectedDateHandler: (DateTime? dateTime) {},
                        )),
                    const SizedBox(width: 15),
                    Expanded(
                        child: DateFormPicker(
                          label: 'End (to)',
                          selectedDateHandler: (DateTime? dateTime) {},
                        )),
                  ],
                ),
                const SizedBox(height: 30),

                Text(
                  'Assign task:',
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(color: AppColors.lightGray, fontSize: 13),
                ),
                const SizedBox(height: 10),
                const UnderLinedTextFormField(
                  label: Text('Add team members'),
                  suffix: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                ),
                const SizedBox(height: 20),
                const UnderLinedTextFormField(
                  label: Text('Tags'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Comment:',
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(color: AppColors.lightGray, fontSize: 13),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: (inputDecorationTheme.border as OutlineInputBorder)
                        .copyWith(borderRadius: BorderRadius.circular(4)),
                    focusedBorder: (inputDecorationTheme.focusedBorder
                            as OutlineInputBorder)
                        .copyWith(borderRadius: BorderRadius.circular(4)),
                    enabledBorder: (inputDecorationTheme.enabledBorder
                            as OutlineInputBorder)
                        .copyWith(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(height: 20),
                ActionButton(text: 'Add task', onPressed: () {}),
                const SizedBox(height: 120)
              ],
            ),
          ),
        ),
        // ),
      ],
    );
  }
}
