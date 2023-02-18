import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 64, 12, 8),
        child: Column(
          children: [
            Lottie.asset("assets/lottie/emptyState.json",),
            const SizedBox(height: 22),
            const Text("هیچکاری برای انجام دادن نداری!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Dirooz'),),
          ],
        ),
      ),
    );
  }
}
