import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/features/splash/domain/interests.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<Interest> imagePaths = [
    Interest(imagePath: "assets/icons/soccer.png", name: "Soccer"),
    Interest(imagePath: "assets/icons/basketball.png", name: "Basketball"),
    Interest(imagePath: "assets/icons/football.png", name: "Football"),
    Interest(imagePath: "assets/icons/baseball.png", name: "Baseball"),
    Interest(imagePath: "assets/icons/tennis.png", name: "Tennis"),
    Interest(imagePath: "assets/icons/volly.png", name: "Volleyball"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "What sport do you interest?",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "You can choose more than one",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return InterestWidget(
                    imagePath: imagePaths[index].imagePath,
                    name: imagePaths[index].name,
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                gradient: AppColors.slightRedGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(color: Colors.transparent),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestWidget extends StatefulWidget {
  const InterestWidget({
    super.key,
    required this.imagePath,
    required this.name,
  });

  final String imagePath;
  final String name;

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  bool isClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
              gradient: isClicked ? AppColors.slightRedGradient : null,
            ),

            child: Image.asset(widget.imagePath),
          ),
          Text(widget.name, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
