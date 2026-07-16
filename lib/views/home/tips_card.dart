import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sistem_pakar_skincare/controller/home_controller.dart';

class TipsCard extends StatelessWidget {
  TipsCard({super.key});

  final HomeController controller =
      Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        /// Judul
        const Text(
          "Tips Harian",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff1F2937),
          ),
        ),

        const SizedBox(height: 18),

        /// Card Tips
        SizedBox(
          height: 180,

          child: PageView.builder(

            controller: controller.pageController,

            itemCount: controller.tips.length,

            itemBuilder: (context, index) {

              return Container(

                margin: const EdgeInsets.only(
                  right: 12,
                ),

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(24),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withOpacity(.05),

                      blurRadius: 18,

                      offset: const Offset(0, 8),

                    ),

                  ],

                ),

                child: Row(

                  children: [

                    /// Icon
                    Container(

                      width: 70,

                      height: 70,

                      decoration: BoxDecoration(

                        color: const Color(
                          0xffEAF7EC,
                        ),

                        borderRadius:
                            BorderRadius.circular(20),

                      ),

                      child: const Icon(

                        Icons.spa,

                        color: Color(
                          0xff2E8B57,
                        ),

                        size: 34,

                      ),

                    ),

                    const SizedBox(width: 18),

                    /// Isi Tips
                    Expanded(

                      child: Column(

                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(

                            "Tips ${index + 1}",

                            style: const TextStyle(

                              fontWeight:
                                  FontWeight.bold,

                              fontSize: 17,

                              color: Color(0xff2E8B57),

                            ),

                          ),

                          const SizedBox(height: 10),

                          Text(

                            controller.tips[index],

                            style: const TextStyle(

                              fontSize: 15,

                              color: Color(0xff4B5563),

                              height: 1.5,

                            ),

                            maxLines: 4,

                            overflow:
                                TextOverflow.ellipsis,

                          ),

                        ],

                      ),

                    ),

                  ],

                ),

              );

            },

          ),

        ),

        const SizedBox(height: 18),

        /// Indicator
        Obx(

          () => Row(

            mainAxisAlignment:
                MainAxisAlignment.center,

            children: List.generate(

              controller.tips.length,

              (index) {

                final active =
                    controller.currentPage.value ==
                        index;

                return AnimatedContainer(

                  duration:
                      const Duration(
                    milliseconds: 250,
                  ),

                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),

                  width: active ? 24 : 8,

                  height: 8,

                  decoration: BoxDecoration(

                    color: active
                        ? const Color(
                            0xff2E8B57)
                        : Colors.grey.shade300,

                    borderRadius:
                        BorderRadius.circular(20),

                  ),

                );

              },

            ),

          ),

        ),

      ],
    );
  }
}