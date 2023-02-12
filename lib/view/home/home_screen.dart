import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO APP",),
        backgroundColor: AppLightColors.lightYellowColor,
      ),
      backgroundColor: AppLightColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppLightColors.lightYellowColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 32,bottom: 86),
        itemCount: 15,
        itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              color: AppLightColors.primaryColor,
              boxShadow: [
                BoxShadow(color: AppLightColors.textColor.withOpacity(0.2),blurRadius: 10)
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("عنوان",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppLightColors.textColor),),
                    const SizedBox(height: 4),
                    Text("متن توضیحات",style: TextStyle(fontSize: 16,color: AppLightColors.textColor),)
                  ],
                ),
              ),
              Checkbox(value: false, onChanged: (value) {},)
            ],
          ),
        );
      },)
    );
  }
}
