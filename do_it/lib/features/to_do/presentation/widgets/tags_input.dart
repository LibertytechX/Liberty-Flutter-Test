import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TagsInput extends StatefulWidget {
  final Function(List<String> tags) onTagsModified;

  const TagsInput({ Key? key, required this.onTagsModified }) : super(key: key);

  @override
  _TagsInputState createState() => _TagsInputState();
}

class _TagsInputState extends State<TagsInput> {
  final TextEditingController tagController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final List<String> _tags = [];
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26
          )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextSmall(
              'Tags:',
              textColor: Colors.black54
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ..._tags.map(
                  (tag) => Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: _Tag(label: tag),
                  )
                ),
                if (_tags.isNotEmpty) SizedBox(width: 12),
                SizedBox(
                  width: size.width * 0.4,
                  child: RawKeyboardListener(
                    onKey: (event) {
                      if (
                        tagController.value.text.isEmpty 
                        && event.logicalKey == LogicalKeyboardKey.backspace
                        && _tags.isNotEmpty
                        && event is RawKeyUpEvent
                      ) {
                        setState(() {
                          _tags.removeLast();
                          widget.onTagsModified(_tags);
                        });
                      }
                    },
            
                    focusNode: FocusNode(),
                    child: TextField(
                      controller: tagController,
                      focusNode: focusNode,
                      onSubmitted: (tag) {
                        if (tag.isEmpty) return;
                        if (_tags.contains(tag)) {
                          showToast('Tag was already added');
                          focusNode.requestFocus();
                          return;
                        }
                        
                        setState(() {
                          _tags.add(tag);
                          widget.onTagsModified(_tags);
                          tagController.clear();
                        });
                        focusNode.requestFocus();
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Enter tag',
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  
  const _Tag({ Key? key, required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _TagPaint(color: Colors.green.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 18, 4),
          child: customTextSmall(
            label,
            textColor: Colors.green,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }
}

class _TagPaint extends CustomPainter {
  final Color color;

  _TagPaint({required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();

    path
      ..moveTo(size.width, size.height * .5)
      ..lineTo(size.width * 0.80, 0)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.80, size.height)
      ..lineTo(size.width, size.height * .5)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}