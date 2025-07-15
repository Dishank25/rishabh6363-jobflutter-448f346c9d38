import 'dart:developer' as developer show log;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/utils/constants/image_string.dart';
import 'package:job_portal/views/User_Profile_Screens/User_Notifications_Screen.dart';
import 'package:job_portal/views/feed/domain/entities/feed_entity.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_bloc.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_event.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_state.dart';
import 'package:job_portal/views/job_related/presentation/views/Feed_Screen_2.dart';
import '../../../../ui_helper/ui_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../../User_Profile_Screens/User_messages_screen.dart';
import '../../../job_related/presentation/views/job_details_view.dart';

class FeedScreen extends StatefulWidget {
  final bool showFeed2;
  final VoidCallback? onCallBackFromFeed2;

  FeedScreen({this.onCallBackFromFeed2, this.showFeed2 = false});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController feedSearchController = TextEditingController();

  List<Map<String, dynamic>> uList = [
    {
      "company_name": "Uber",
      "image":
          "https://static-00.iconduck.com/assets.00/uber-icon-1024x1024-4icncyyo.png",
      "posted": "2 days",
      "No_followers": "123,456 followers",
      "mainImage": "assets/Images/uber_driver.jpg"
    },
  ];

  FeedEntity? feedPostsData;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final bloc = context.read<FeedBloc>();

    bloc.add(LoadFeedPosts());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showFeed2) {
      return FeedScreen2(onBack: widget.onCallBackFromFeed2);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: SvgPicture.asset(
            ImageString.jobPortalLogo,
            height: 30,
            // width: 40,
            fit: BoxFit.contain,
            allowDrawingOutsideViewBox: true, // optional
          ),
          // child: Image.asset(ImageString.pngLogo),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagesScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/message_icon.svg"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/Icons/notifications_icon.svg"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            BlocListener<FeedBloc, FeedState>(
              listener: (context, state) {
                if (state is FeedPostsLoaded) {
                  final data = state.feedEntity;

                  setState(() {
                    feedPostsData = data;
                  });

                  developer.log('Feed posts data : ${data.posts.first.id}');
                }
              },
              child: SizedBox(),
            ),
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    onTextChanged: (value) {
                      print("search text changed.");
                    },
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                SvgPicture.asset("assets/Icons/settings-sliders 1.svg")
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            if (feedPostsData != null)
              Expanded(
                child: ListView.builder(
                  itemCount: feedPostsData?.posts.length,
                  padding: const EdgeInsets.only(bottom: 16),
                  itemBuilder: (context, index) {
                    // final item = uList[index];
                    // return Padding(
                    //   padding: const EdgeInsets.only(bottom: 20),
                    //   child: FeedCard(
                    //     // imageUrl: item["image"],
                    //     imageUrl: ImageString.dummyImageUrl,
                    //     company: item["company_name"],
                    //     posted: item["posted"],
                    //     noFollowers: item["No_followers"],
                    //     mainImage: item["mainImage"],
                    //   ),
                    // );

                    final item = feedPostsData?.posts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FeedCard(
                        // imageUrl: item["image"],
                        imageUrl: ImageString.dummyImageUrl,
                        company: item!.user.firstName,
                        posted: '1 day ago',
                        bodyText: item.caption,
                        noFollowers: "123,456 followers",
                        mainImage: item.image,
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

/// FEED CARD WIDGET
class FeedCard extends StatelessWidget {
  final String imageUrl, company, posted, noFollowers;
  final String? mainImage;
  final String bodyText;

  const FeedCard(
      {super.key,
      required this.imageUrl,
      required this.company,
      required this.posted,
      required this.noFollowers,
      this.mainImage,
      required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// First Row - Icon + Title + Company + Right Tags
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  imageUrl,
                  // fit: BoxFit.cover,
                ),
                // backgroundImage: Image.network(
                //   imageUrl,
                //   height: 48,
                //   width: 48,
                //   // fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(jobTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(company, style: const TextStyle(color: Colors.grey)),
                    Text(noFollowers)
                  ],
                ),
              ),
              const Icon(Icons.more_vert)
            ],
          ),
          const SizedBox(height: 12),

          /// Second Row - Grey Containers aligned Left under the Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              greyContainer(text: posted, bgColor: const Color(0xffEFF0F6)),
              const SizedBox(width: 8),
              greyContainer(
                text: "Sponsored",
                bgColor: const Color(0xffEFF0F6),
              ),
            ],
          ),
          // SizedBox(height: 10,),
          if (mainImage != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(
                  mainImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Text(
            bodyText,
            style: mTextStyle12(mFontWeight: FontWeight.w400),
          ),
          Text(
            "Read more...",
            style: mTextStyle12(mColor: const Color(0xff8F8F8F)),
          )
        ],
      ),
    );
  }
}

/// Customized Floating Action Button
