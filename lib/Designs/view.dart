import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitest/Controllers/view_controller.dart';
import 'package:uitest/Widgets/app_bar_title.dart';
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
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: windowHeight * 0.06,
          width: windowWidth,
          color: Colors.black,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Proceed to Pick Date and Time',
              style: TextStyle(
                color: Colors.white,
                fontSize: windowHeight * 0.02,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: windowHeight * 0.42,
            child: Column(
              children: [
                SizedBox(
                  height: windowHeight * 0.3,
                  child: Image.network(
                    'https://www.airedalecooling.com/wp-content/uploads/2018/10/iStock-803892176.jpg',
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
                          children: const [
                            Text(
                              'Air Conditioner',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipi elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua.',
                              style: TextStyle(
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: windowHeight * 0.1,
                          width: windowWidth * 0.18,
                          child: Image.network(
                            viewController
                                .airData.value.data!.services![index].imageUrl
                                .toString(),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewController.airData.value.data!
                                  .services![index].serviceName
                                  .toString(),
                            ),
                            Text(
                              "Avg Cost: " +
                                  viewController
                                      .airData.value.data!.services![index].rate
                                      .toString() +
                                  " Sar",
                            ),
                            Text(
                              viewController.airData.value.data!
                                  .services![index].description
                                  .toString(),
                            ),
                          ],
                        ),
                        Container(
                          height: windowHeight * 0.04,
                          width: windowWidth * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontSize: windowHeight * 0.02,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
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
            },
          )
        ],
      ),
    );
  }
}
