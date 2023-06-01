import 'package:flutter/material.dart';

// class There extends StatelessWidget {
//   const There({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Center(
//         child: Text('three'),
//       ),
//     );
//   }
// }

class There extends StatefulWidget {
  @override
  _threeState createState() => _threeState();
}

class _threeState extends State<There> {
  String variableSatu = "three";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Masuk sini");

        // Merubah nilai variableSatu dari three menjadi dendy
        variableSatu = "Dendy";

        // Untuk render ulang / build ulang tampilan dengan tampilan terbaru
        setState(() {});
      },
      child: Center(
        child: Text(variableSatu),
      ),
    );
  }
}
