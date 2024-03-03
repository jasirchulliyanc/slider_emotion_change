import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      const MaterialApp(
        home: PathExample(),
      ),
    );

class PathExample extends StatefulWidget {
  const PathExample({super.key});

  @override
  State<PathExample> createState() => _PathExampleState();
}

class _PathExampleState extends State<PathExample> {
  double eye1 = 200;
  double eye2 = 250;
  double nose = 200;
  double lipHieght = 350;
  double dragValue = 0;
  double teethWidth1 = 0;
  double teethHeight1 = 0;
  double teethWidth2 = 0;
  double teethHeight2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: CustomPaint(
                    painter: PathPainter(lipHieght: eye1),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    width: 100,
                    height: 50,
                    child: CustomPaint(
                      painter: PathPainter(lipHieght: eye2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CustomPaint(
                    painter: PathPainter(lipHieght: nose),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 500,
            height: 350,
            child: CustomPaint(
              painter: PathPainter(lipHieght: lipHieght),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: teethWidth1,
                    height: teethHeight1,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: teethWidth2,
                    height: teethHeight2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Slider(
                value: dragValue,
                onChanged: (value) {
                  setState(() {
                    if (dragValue == 0 || dragValue < value) {
                      double newHeight = value + 5;

                      lipHieght = lipHieght - newHeight;
                      eye1 = eye1 - (value + 2);
                      eye2 = eye2 - (value + 3);
                      nose = nose - (value + 2);

                      if (teethHeight1 < 50) {
                        teethHeight1 = teethHeight1 + 0.5;
                        teethWidth1 = teethWidth1 + 0.5;
                      }
                      if (teethHeight2 < 60) {
                        teethHeight2 = teethHeight2 + 0.5;
                        teethWidth2 = teethWidth2 + 0.5;
                      }
                      print("new height: $lipHieght");
                      print("new height1: $eye1");
                      print("new height2: $eye2");
                      if (lipHieght < -120) {
                        lipHieght = lipHieght + newHeight;
                      }

                      if (eye1 < -125) {
                        eye1 = eye1 + (value + 3);
                      }

                      if (eye2 < -200) {
                        eye2 = eye2 + (value + 3);
                      }

                      if (nose < -125) {
                        nose = nose + (value + 2);
                      }
                    } else {
                      double newHeight = value + 5;
                      lipHieght = lipHieght + newHeight;
                      eye1 = eye1 + (value + 2);
                      eye2 = eye2 + (value + 3);
                      nose = nose + (value + 2);
                      if (teethHeight1 > 0) {
                        teethHeight1 = teethHeight1 - 0.5;
                        teethWidth1 = teethWidth1 - 0.5;
                      }
                      if (teethHeight2 > 0) {
                        teethHeight2 = teethHeight2 - 0.5;
                        teethWidth2 = teethWidth2 - 0.5;
                      }
                    }

                    dragValue = value;
                  });
                },
                onChangeEnd: (value) {
                  setState(() {
                    if (value == 1) {
                      eye1 = 200;
                      eye2 = 250;
                      nose = 200;
                      lipHieght = 350;
                      dragValue = 0;
                      teethWidth1 = 0;
                      teethHeight1 = 0;
                      teethWidth2 = 0;
                      teethHeight2 = 0;
                    }
                  });
                },
                onChangeStart: (value) {
                  // lipHieght = 300;
                  // eye1 = 200;
                  // eye2 = 250;
                  // dragValue = 0;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  PathPainter({required this.lipHieght});
  final double lipHieght;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, lipHieght, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
