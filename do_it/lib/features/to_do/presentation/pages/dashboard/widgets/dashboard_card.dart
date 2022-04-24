import 'package:do_it/core/constants/texts.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color background;
  final Color color;
  
  const DashboardCard({ 
    Key? key, 
    required this.label, 
    required this.value, 
    required this.icon, 
    required this.background, 
    required this.color 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(icon, size: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: customTextLarge(
                    value,
                    fontWeight: FontWeight.w600,
                    alignment: TextAlign.end
                  ),
                )
              ],
            ),
            const SizedBox(height: 58),
            customTextNormal(
              label,
              alignment: TextAlign.start
            )
          ],
        ),
      ),
    );
  }
}