import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitest/Controllers/view_controller.dart';
import 'package:uitest/Widgets/add_button.dart';
import 'package:uitest/Widgets/app_bar_title.dart';
import 'package:uitest/Widgets/bottom_button.dart';
import 'package:uitest/Widgets/leading_back_button.dart';

class View extends StatelessWidget {
  final ViewController viewController = Get.put(ViewController());

  View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: const LeadingBackButton(),
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const AppBarTitle(
          title: 'Select Service',
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: BottomButton(
          windowHeight: windowHeight,
          windowWidth: windowWidth,
          title: "Proceed to Pick Date and Time",
          onPressed: () {},
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: windowHeight * 0.42,
            child: Column(
              children: [
                Container(
                  height: windowHeight * 0.3,
                  width: windowWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(
                        viewController.airData.value.data!.imageUrl.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('Assets/Images/ac-hx-02.png'),
                      SizedBox(width: windowWidth * 0.05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewController.airData.value.data!.categoryName
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              viewController.airData.value.data!.description
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                'Choose Services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 2,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: viewController.airData.value.data!.services!.length,
            itemBuilder: (BuildContext context, int index) {
              if (index ==
                  viewController.airData.value.data!.services!.length) {
                return SizedBox(height: windowHeight * 0.1);
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: windowHeight * 0.08,
                            width: windowWidth * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                              image: DecorationImage(
                                image: NetworkImage(
                                  viewController.airData.value.data!
                                      .services![index].imageUrl
                                      .toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewController.airData.value.data!
                                    .services![index].serviceName
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Avg Cost: " +
                                    viewController.airData.value.data!
                                        .services![index].rate
                                        .toString() +
                                    " Sar",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                viewController.airData.value.data!
                                    .services![index].description
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 15),
                              ),
                            ],
                          ),
                          AddButton(
                            windowHeight: windowHeight,
                            windowWidth: windowWidth,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 2,
                    ),
                  ],
                );
              }
            },
          ),
          // SizedBox(
          //   height: windowHeight,
          // ),
        ],
      ),
    );
  }
}
