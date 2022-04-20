// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';

// class HeartRate extends StatefulWidget {
//   @override
//   State<HeartRate> createState() => _HeartRateState();
// }

// class _HeartRateState extends State<HeartRate> {
//   var rng = Random();
//   var number = 0;
//   Timer _timer;
//   int start = 73;

//   @override
//   void initState() {
//     super.initState();
//     startDanger();
//   }

//   void stopTimer() {
//     setState(() {
//       _timer.cancel();
//     });
//   }

//   void startDanger() {
//     const oneSec = const Duration(milliseconds: 300000);
//     print(start);
//     _timer = new Timer.periodic(oneSec, (Timer timer) {
//       // if (start == 0) {
//       //   setState(() {
//       //     timer.cancel();
//       //   });
//       // } else {
//       setState(() {
//         start = rng.nextInt(20) + 101;
//         print("startDanger");
//       });
//       // }
//     });
//   }

//   void startNormal() {
//     print(start);
//     const oneSec = const Duration(milliseconds: 300000);
//     _timer = new Timer.periodic(oneSec, (Timer timer) {
//       if (start == 0) {
//         setState(() {
//           _timer.cancel();
//         });
//       } else {
//         setState(() {
//           start = rng.nextInt(20) + 73;
//           print("startNormal");
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 2,
//               height: MediaQuery.of(context).size.height / 4,
//               child: ElevatedButton(
//                 onPressed: () {
//                   stopTimer();
//                   print("หยุด");
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                   shadowColor: Colors.transparent,
//                 ),
//                 child: Text("Stop", style: TextStyle(color: Colors.black)),
//               ),
//             ),
//           ],
//         ),
//         Container(
//           width: 200,
//           height: 200,
//           padding: EdgeInsets.all(20),
//           alignment: Alignment.center,
//           decoration:
//               BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
//           child: Text(
//             "$start",
//             style: TextStyle(fontSize: 50),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//                 width: MediaQuery.of(context).size.width / 2,
//                 height: MediaQuery.of(context).size.height / 4,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     startDanger();
//                     print("วิ่ง");
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//                     shadowColor: Colors.transparent,
//                   ),
//                   child: Text("Start แบบวิ่ง"),
//                 )),
//             SizedBox(
//                 width: MediaQuery.of(context).size.width / 2,
//                 height: MediaQuery.of(context).size.height / 4,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     startNormal();
//                     print("ไม่วิ่ง");
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//                     shadowColor: Colors.transparent,
//                   ),
//                   child: Text("Start แบบไม่วิ่ง"),
//                 ))
//           ],
//         )
//       ],
//     ));
//   }
// }

// // var rng = Random();
// //   var number = 0;
// //   late Timer _timer;
// //   int start = 101;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   void stopTimer() {
// //     setState(() {
// //       _timer.cancel();
// //     });
// //   }

// //   void startTimer() {
// //     const oneSec = const Duration(microseconds: 300000);
// //     _timer = new Timer.periodic(
// //       oneSec,
// //       (Timer timer) {
// //         if (start == 0) {
// //           setState(() {
// //             timer.cancel();
// //           });
// //         } else {
// //           setState(() {
// //             // start = rng.nextInt(20) + 60;
// //             start = rng.nextInt(20) + 101;
// //           });
// //         }
// //       },
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _timer.cancel();
// //     super.dispose();
// //   }

// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       appBar: AppBar(title: Text("Timer test")),
// //       body: Column(
// //         children: <Widget>[
// //           Text("$start"),
// //           ElevatedButton(
// //             onPressed: () {
// //               startTimer();
// //             },
// //             style: ElevatedButton.styleFrom(
// //               primary: Colors.blue,
// //               shadowColor: Colors.transparent,
// //             ),
// //             child: Text("Start"),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               stopTimer();
// //             },
// //             style: ElevatedButton.styleFrom(
// //               primary: Colors.red,
// //               shadowColor: Colors.transparent,
// //             ),
// //             child: Text("Stop", style: TextStyle(color: Colors.black)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HeartRate extends StatefulWidget {
  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  var rng = Random();
  var number = 0;
  Timer timer;
  int start = 0;

  @override
  void initState() {
    super.initState();
  }

  void stopTimer() {
    setState(() {
      timer.cancel();
      start = 0;
    });
  }

  void startNormal() {
    //อันนี้ปกติ
    const oneSec = const Duration(microseconds: 300000);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start = rng.nextInt(20) + 73;
          });
        }
      },
    );
  }

  void startTimer() {
    //อันนี้วิ่ง
    const oneSec = const Duration(microseconds: 300000);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start = rng.nextInt(20) + 101;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 4,
              child: ElevatedButton(
                onPressed: () {
                  stopTimer();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text("stop"),
              ),
            ),
          ],
        ),
        Container(
          width: 220,
          height: 220,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(width: 3.0, color: Colors.green[300])),
          child: Column(
            children: [
              Text(
                "$start",
                style: TextStyle(fontSize: 50),
              ),
              Text(
                "อัตราการเต้นของหัวใจ",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Opun',
                ),
              ),
              Image.asset(
                'assets/images/pulse.gif',
                scale: 2.5,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 4,
              child: ElevatedButton(
                onPressed: () {
                  startTimer();
                  setState(() {
                    start = 70;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text("Start แบบวิ่ง"),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 4,
              child: ElevatedButton(
                onPressed: () {
                  startNormal();
                  setState(() {
                    start = 70;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text("Start แบบไม่วิ่ง"),
              ))
        ])
      ],
    );
  }
}
