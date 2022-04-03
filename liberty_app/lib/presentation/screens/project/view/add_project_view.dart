import 'package:flutter/material.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

import 'package:liberty_app/app/theme.dart';
import 'package:material_tag_editor/tag_editor.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  static route() =>
      MaterialPageRoute<void>(builder: (_) => const AddProjectScreen());

  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  @override
  Widget build(BuildContext context) {
    var inputDecorationTheme = Theme
        .of(context)
        .inputDecorationTheme;
    return SliverAppScaffold(
      backIcon: AssetsSvg.backArrowIos(),
      bodyWidgets: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 10),
        ),

        /// Page Title
        SliverToBoxAdapter(
          child: Text('Create Project',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline2),
        ),

        /// Project form
        Form(
          child: SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CircleAvatar(backgroundColor: AppColors.lightGray),
                    SizedBox(width: 15),
                    Expanded(
                        child: UnderLinedTextFormField(
                          label: Text('Project Name'),
                        )),
                  ],
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
                  'Assign to:',
                  style: Theme
                      .of(context)
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
                // const _TagWidget(values: [],),
                const SizedBox(height: 20),
                Text(
                  'Description:',
                  style: Theme
                      .of(context)
                      .textTheme
                      .overline
                      ?.copyWith(color: AppColors.lightGray, fontSize: 13),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 2,
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
                // for(int i=0; i<17;i++)
                ActionButton(text: 'Create Project', onPressed: () {}),
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


class _TagWidget extends StatefulWidget {
  const _TagWidget({Key? key, required this.values}) : super(key: key);
  final List<String> values;

  @override
  _TagWidgetState createState() => _TagWidgetState();
}

class _TagWidgetState extends State<_TagWidget> {

  @override
  Widget build(BuildContext context) {
    return TagEditor(
      length: widget.values.length,
      delimiters: const [',', ' '],
      hasAddButton: true,
      inputDecoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Tags',
      ),
      onTagChanged: (newValue) {
        setState(() {
          widget.values.add(newValue);
        });
      },
      tagBuilder: (context, index) =>
          _Chip(
            index: index,
            label: widget.values[index],
            onDeleted: (i) {},
          ),
    );
  }

}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}


