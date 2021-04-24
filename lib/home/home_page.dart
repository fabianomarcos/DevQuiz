import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/home_state.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage  extends StatefulWidget {
  HomePage({Key? key }) : super(key: key);

  @override
   _HomePageState createState() =>  _HomePageState();
}

class _HomePageState extends State<HomePage> {
	final controller = HomeController();

	@override
	void initState() {
		super.initState();
		controller.getUser();
		controller.getQuizzes();
		controller.stateNotifier.addListener(() {
			setState((){});
		});
	}

	@override
	Widget build(BuildContext context) {
			return controller.state == HomeState.success
				? Scaffold(
					appBar: AppBarWidget(user: controller.user!),
					body: Padding(
						padding: const EdgeInsets.symmetric(horizontal: 16),
						child: Column(
						children: [
							SizedBox(height: 24,),
							Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								LevelButtonWidget(
								label: "Fácil",
								),
								LevelButtonWidget(
								label: "Médio",
								),
								LevelButtonWidget(
								label: "Difícil",
								),
								LevelButtonWidget(
								label: "Perito",
								),
							],
							),
							SizedBox(height: 24,),
							Expanded(
								child: GridView.count(
									crossAxisSpacing: 16,
									mainAxisSpacing: 16,
									crossAxisCount: 2,
									children: controller.quizzes!
										.map((quiz) => QuizCardWidget(
											title: quiz.title,
											completed: "${quiz.questionAnswered}/${quiz.questions.length}",
											percent: quiz.questionAnswered/quiz.questions.length,
											onTap: (){
												Navigator.push(context, MaterialPageRoute(
													builder: (context) => ChallengePage(
														questions: quiz.questions,
														title: quiz.title,
													))
												);
											},
										)).toList(),
								),
							)
						],
						),
					),
				)
				: Scaffold(
					body: Center(child: CircularProgressIndicator(
						valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
					),)
				);
	}
}
