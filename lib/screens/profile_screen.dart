import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seclob/constants/constants.dart';
import 'package:seclob/controller/profile_controller.dart';
import 'package:seclob/model/response_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = ProfileController();
  late Future<ResponseModel> profileFuture;

  @override
  void initState() {
    profileFuture = profileController.loadProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      bottomNavigationBar: Container(
        child: Stack(children: [
          Image.asset(
            "assets/images/rect.png",
            fit: BoxFit.fill,
          ),
          Image.asset("assets/images/bottombar.png")
        ]),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return profileFuture = profileController.loadProfileData();
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/share_icon.png",
                    scale: 4,
                  ),
                  Image.asset(
                    "assets/images/options_icon.png",
                    scale: 4,
                  ),
                ],
              ),
            ),
            const Gap(23),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder(
                          future: profileFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: Container(
                                  height: 86,
                                  width: 86,
                                  color: Colors.grey[100],
                                  child: Image.network(
                                      snapshot.data!.media!.first.profilePic ??
                                          ""),
                                ),
                              );
                            }
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(48),
                              child: Container(
                                height: 86,
                                width: 86,
                                color: Colors.grey[100],
                              ),
                            );
                          }),
                      const TextColumnWidget(
                        title: "50",
                        subTitle: "Posts",
                      ),
                      const TextColumnWidget(
                        title: "564",
                        subTitle: "Followers",
                      ),
                      const TextColumnWidget(
                        title: "564",
                        subTitle: "Following",
                      ),
                    ],
                  ),

                  const Gap(6),
                  Text("Krishna Kumar", style: AppConstants.textMedium),
                  // const  Gap(6),
                  Text(
                    "Photographer",
                    style: AppConstants.textMedium.copyWith(fontSize: 10),
                  ),
                  Text(
                    "🌟 You are beautiful and\nI am here to capture it 🌟",
                    style: AppConstants.textMedium
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ButtonWidget(
                        color: AppConstants.buttonBlue,
                        title: "Edit Profile",
                        height: 40,
                      )),
                      const Gap(8),
                      Expanded(
                          child: ButtonWidget(
                              color: AppConstants.buttonDarkBlue,
                              title: "Wallet",
                              height: 40)),
                      const Gap(8),
                      Image.asset(
                        "assets/images/phone_icon.png",
                        scale: 4,
                      )
                    ],
                  ),
                  // const Gap(24),
                  // Container(
                  //   height: 30,
                  // ),
                  // const Gap(10),
                ],
              ),
            ),
            const Gap(20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3),
              height: 24,

              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1, color: Color(0xffD3D5E7).withOpacity(0.4)),
                      bottom: BorderSide(
                          width: 1,
                          color: Color(0xffD3D5E7).withOpacity(0.4)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Photos",
                    style: AppConstants.textMediumGrey,
                  ),
                  VerticalDivider(
                    color: Color(0xffA7ACD0).withOpacity(0.31),
                    width: 2,
                  ),
                  Text(
                    "Videos",
                    style: AppConstants.textMediumGrey,
                  ),
                ],
              ),
              // color:Color(0xffD3D5E7).withOpacity(0.4),
            ),

            //  const Gap(24),
            //   Container(
            //   height: 1,
            //   width: double.infinity,
            //   color:Color(0xffD3D5E7).withOpacity(0.4),
            // ),
            const Gap(31),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: FutureBuilder(
                  future: profileFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CupertinoActivityIndicator(
                        radius: 25,
                      ));
                      // return const Center(
                      //     child: CircularProgressIndicator.adaptive());
                    }
                    if (snapshot.hasData) {
                      List<Media> media = snapshot.data!.media ?? [];
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                crossAxisCount: 3),
                        itemCount: media.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(media[index].filePath!),
                                      fit: BoxFit.cover)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/like_icon.png",
                                            scale: 4,
                                          ),
                                          Text(
                                            media[index].likeCount.toString() ??
                                                "",
                                            style: AppConstants.textMedium
                                                .copyWith(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      const Gap(20),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/comment_icon.png",
                                            scale: 4,
                                          ),
                                          Text(
                                            media[index]
                                                    .commentCount
                                                    .toString() ??
                                                "",
                                            style: AppConstants.textMedium
                                                .copyWith(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Gap(5)
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("No data"));
                    }
                  }),
            ),
            const Gap(15)
          ],
        ),
      ),
    );
  }
}

class TextColumnWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TextColumnWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppConstants.textLarge,
        ),
        Text(
          subTitle,
          style: AppConstants.textMediumGrey,
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double height;
  final double? width;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.color,
    required this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(
          child: Text(
        title,
        style: AppConstants.textMedium
            .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
      )),
    );
  }
}
