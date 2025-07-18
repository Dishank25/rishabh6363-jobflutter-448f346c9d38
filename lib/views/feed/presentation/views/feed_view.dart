import 'dart:developer' as developer show log;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/utils/constants/image_string.dart';
import 'package:job_portal/views/user_profile/presentation/views/User_Notifications_Screen.dart';
import 'package:job_portal/views/feed/domain/entities/feed_entity.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_bloc.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_event.dart';
import 'package:job_portal/views/feed/presentation/bloc/feed_state.dart';
import 'package:job_portal/views/job_related/presentation/views/Feed_Screen_2.dart';
import '../../../../ui_helper/ui_helper.dart';
import '../../../../widgets/widgets.dart';
import '../../../user_profile/presentation/views/User_messages_screen.dart';
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

  String getPostedDaysAgo(String isoDateString) {
    final postDate = DateTime.parse(isoDateString).toLocal();
    final now = DateTime.now();
    final difference = now.difference(postDate);

    if (difference.inDays == 0) {
      if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
      } else {
        return 'Just now';
      }
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${difference.inDays} days ago';
    }
  }

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
              child: const SizedBox(),
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
                        // posted: '1 day ago',
                        posted: getPostedDaysAgo(item.createdAt.toString()),
                        // bodyText: item.caption,
                        bodyText:
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                        noFollowers: "${item.user.followersCount} followers",
                        // mainImage: item.image,
                        mainImage: ImageString.placeHolderImage,
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

/// FEED CARD WIDGET
class FeedCard extends StatefulWidget {
  final String imageUrl, company, posted, noFollowers;
  final String? mainImage;
  final String bodyText;

  const FeedCard({
    super.key,
    required this.imageUrl,
    required this.company,
    required this.posted,
    required this.noFollowers,
    this.mainImage,
    required this.bodyText,
  });

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  bool isExpanded = false;

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
                backgroundImage: NetworkImage(widget.imageUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.company,
                        style: const TextStyle(color: Colors.grey)),
                    Text(widget.noFollowers),
                  ],
                ),
              ),
              const Icon(Icons.more_vert)
            ],
          ),
          const SizedBox(height: 12),

          /// Tags
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              greyContainer(
                  text: widget.posted, bgColor: const Color(0xffEFF0F6)),
              const SizedBox(width: 8),
              greyContainer(
                  text: "Sponsored", bgColor: const Color(0xffEFF0F6)),
            ],
          ),

          /// Optional Image
          if (widget.mainImage != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 6.0, 2.0, 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  widget.mainImage!,
                  fit: BoxFit.cover,
                  color: Colors.grey[400],
                  // color: Color.fromARGB(255, 240, 55, 41).withOpacity(0.3),
                  // color: Colors.blue.shade200,
                  // colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),

          /// Body Text with Read More
          AnimatedCrossFade(
            firstChild: Text(
              widget.bodyText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: mTextStyle12(
                  mFontWeight: FontWeight.w400,
                  mColor: const Color.fromARGB(255, 84, 76, 76)),
            ),
            secondChild: Text(
              widget.bodyText,
              style: mTextStyle12(
                  mFontWeight: FontWeight.w400,
                  mColor: const Color.fromARGB(255, 84, 76, 76)),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),

          /// Read more / Read less button
          // if (widget.bodyText.length > 100)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                isExpanded ? "Read less..." : "Read more...",
                style: mTextStyle12(
                  // mColor: const Color(0xff8F8F8F),
                  mColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Customized Floating Action Button
