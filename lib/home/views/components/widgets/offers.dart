import 'package:flutter/material.dart';
import 'package:slash_task/core/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Offers extends StatelessWidget {
  const Offers({super.key, required this.width, required this.height, required this.isPhone});

  final dotDimension = 7.0;
  final double width;
  final double height;
  final bool isPhone;

  @override
  Widget build(BuildContext context) {

    int currPage = 0;
    PageController controller = PageController(
      viewportFraction:  width / MediaQuery.of(context).size.width
    );

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                height: height,
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget? child) {
                        double value = 1.0;
                        if (controller.position.haveDimensions) {
                          if(controller.page!.toInt() == controller.page){
                            currPage = controller.page!.toInt();
                          }
                          value = controller.page! - index;
                          value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                        }else{
                          value = (1 - (index * 0.2)).clamp(0.0, 1.0);
                        }
                        return Center(
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              height: Curves.easeOut.transform(value) * height,
                              width: Curves.easeOut.transform(value) * width,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                  image: AssetImage("assets/offer_1.png",),
                                  fit: BoxFit.fill
                                ),
                                color: greyColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,14,0,screenPadding),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                onDotClicked: !isPhone? (index){
                  controller.animateToPage(
                    index,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut);
                } : (index){

                },
                effect: ExpandingDotsEffect(
                  radius: 8,
                  dotWidth: dotDimension,
                  dotHeight: dotDimension,
                  activeDotColor: darkColor,
                  expansionFactor: 2,
                ),
              ),
            )
          ],
        ),
        Visibility(
          visible: !isPhone,
          child: Positioned(
            right: screenPadding,
            top: 16,
            child: InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: (){
                if(controller.page!.toInt() == controller.page){
                  controller.animateToPage(
                      currPage + 1 > 2? 2 : currPage + 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut
                  );
                }
              },
              child: Container(
                height: height,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyColor.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: darkColor,
                )
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isPhone,
          child: Positioned(
            left: screenPadding,
            top: 16,
            child: InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: (){
                if(controller.page!.toInt() == controller.page){
                  controller.animateToPage(
                      currPage - 1 < 0? 0 : currPage - 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut
                  );
                }
              },
              child: Container(
                height: height,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyColor.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: darkColor,
                )
              ),
            ),
          ),
        )
      ],
    );
  }
}



