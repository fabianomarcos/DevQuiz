import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'answer_widget.dart';

class QuizWidget extends StatefulWidget {
	final controller = ChallengeController();
	final QuestionModel question;
	final ValueChanged<bool> onSelected;
	QuizWidget({Key? key, required this.question, required this.onSelected,}) : super(key: key);

	@override
	_QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
	int indexSelected = -1;

	AnswerModel answer(int index) => widget.question.answers[index];

	@override
	Widget build(BuildContext context) {
		return Container(
			child: Column(
				children: [
					SizedBox(height: 64),
					Text(
						widget.question.title,
						style: AppTextStyles.heading,
					),
					SizedBox(height: 24),
					for (var i = 0; i < widget.question.answers.length; i++)
					AnswerWidget(
						disabled: indexSelected != -1,
						answer: answer(i),
						isSelected: indexSelected == i,
						onTap: (value) {
							indexSelected = i;
							widget.onSelected(value);
							setState(() {});
						},
					)
				],
			),
		);
  	}
}
