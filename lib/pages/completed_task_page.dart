import 'package:flutter/material.dart';

import '../util/grid_item.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            children: [
              //completed task text
              Text(
                "Completed Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, -7),
                    ),
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                  decorationColor: Colors.grey[300],
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              const SizedBox(height: 40,),

              //monthly scrollable bar

              //grid item
              Expanded(
                child: GridView.builder(
                    itemCount: 12,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      // childAspectRatio: 8/
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const GridItem();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
