import 'package:flutter/widgets.dart';
import 'package:quiz_app/widgets/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summaryDataItem) => SummaryItem(summaryDataItem)).toList(),
        ),
      ),
    );
  }
}
