import 'package:flutter/material.dart';
import 'cpd_activity_app.dart';

class WelcomeSceen extends StatefulWidget {
  const WelcomeSceen({super.key});

  @override
  State<WelcomeSceen> createState() => _WelcomeSceenState();
}

class _WelcomeSceenState extends State<WelcomeSceen> {
  List images = [
    "welcome-one.jpg",
    "welcome-two.jpg",
    "welcome-three.jpg",
  ];
  List lageText = [
    "CPDMO",
    "CPD credits",
    "CPD accreditation",
  ];
  List appText = [
    "Continuous Professional Development",
    "Credits are awarded on the basis of the",
    "Applicants for accreditation",
  ];
  List text = [
    "CPD stands for Continuous Professional Development and is the term used to describe the learning activities professionals engage in to develop and enhance their abilities",
    "CPD credits may be earned for both types of CPD. The CPD system is being introduced in Cambodia as a phased process, beginning with structured CPD..",
    "CPD provider or for accreditation of a CPD offering obtain the relevant form from the CPDMO or download it from the CPDMO website, fill it in and send it, along with the supporting evidence to the CPDMO",
  ];

  Future<void> readLogics(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => cpdActivityAppWithProvider(),
                  ),
                );
              },
              icon: const Icon(Icons.dashboard),
            ),
          ],
        ),
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("pictures/${images[index]}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: lageText[index]),
                        AppText(
                          text: appText[index],
                          size: 20,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: 320,
                          child: AppText(
                            text: "${text[index]}",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppLargeText({
    super.key,
    this.size = 30,
    this.text = "text",
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppText({
    super.key,
    this.size = 16,
    this.text = "text",
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
