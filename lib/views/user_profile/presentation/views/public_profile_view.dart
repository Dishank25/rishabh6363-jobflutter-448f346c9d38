import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/utils/constants/image_string.dart';

class UserPublicProfileScreen extends StatelessWidget {
  const UserPublicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        // title: const Text('Logo',
        //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        title: SvgPicture.asset(
          ImageString.jobPortalLogo,
          height: 30,
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.message_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none, // <--- allow overflow
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    ImageString.dummyImageUrl,
                    height: 125,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -20, // this overlaps below the image
                  left: 16,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(ImageString.dummyImageUrl),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add space after to avoid layout jump

            const SizedBox(height: 40),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Aman Gupta',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 4),
                      Text('@amangupta09',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 8),
                      Text('Visual Designer'),
                      SizedBox(height: 4),
                      Text(
                          'Hi, I am Aman working as a designer from 3 years. My skills include Adobe Photoshop,...',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // transparent background
                    shape: const StadiumBorder(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 0,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: const BorderSide(
                      // blue border
                      color: Color.fromARGB(255, 29, 97, 231),
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    'Follow',
                    style: TextStyle(
                      color: Color.fromARGB(255, 29, 97, 231),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 29, 97, 231),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6), // Slimmer padding
                    elevation: 0, // optional: flat modern look
                    minimumSize: Size.zero, // removes min size constraint
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // tighter tap area
                  ),
                  child: const Text(
                    '2,900 followers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13, // smaller font for a sleeker look
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: Color.fromARGB(255, 29, 97, 231),
                //       shape: StadiumBorder()),
                //   child: const Text('1,021 following',
                //       style: TextStyle(color: Colors.white)),
                // ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 29, 97, 231),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6), // Slimmer padding
                    elevation: 0, // optional: flat modern look
                    minimumSize: Size.zero, // removes min size constraint
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // tighter tap area
                  ),
                  child: const Text(
                    '1,021 following',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13, // smaller font for a sleeker look
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            const SectionTitle('Your Activity'),
            ActivityCard(
              avatarUrl: ImageString.dummyImageUrl,
              name: 'Rohan',
              subtitle: 'Digital Marketer @Uber',
              content:
                  'Hey! Just started a new project. Check the link in my profile and comment your suggestions. see more...',
            ),
            // TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       "See more",
            //       style: TextStyle(
            //         color: Color.fromARGB(255, 29, 97, 231),
            //       ),
            //     ),
            // ),
            SeeMoreDivider(),
            const SectionTitle('Work Experience'),
            InfoCard(
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.work, color: Colors.white),
              ),
              title: "Graphic Designer",
              subtitles: [
                "Uber",
                "June 23 - Present | 1 year 11 months",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus eros eu vehicula interdum.",
              ],
            ),
            // TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       "See more",
            //       style: TextStyle(
            //         color: Color.fromARGB(255, 29, 97, 231),
            //       ),
            //     )),
            SeeMoreDivider(),

            const SectionTitle('Education'),
            InfoCard(
              leading: const Icon(Icons.school, color: Colors.red),
              title: "Delhi Technological University",
              subtitles: ["Bachelor's degree, Design", "2018 - 2022"],
            ),
            // TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       "See more",
            //       style: TextStyle(
            //         color: Color.fromARGB(255, 29, 97, 231),
            //       ),
            //     )),

            SeeMoreDivider(),

            const SectionTitle('Skills'),
            InfoCard(
              leading: const Icon(Icons.design_services_outlined,
                  color: Colors.purple),
              title: "Visual Identity",
              subtitles: ["Delhi Technological University"],
            ),

            // TextButton(
            //     onPressed: () {},
            //     child: const Text(
            //       "See more",
            //       style: TextStyle(
            //         color: Color.fromARGB(255, 29, 97, 231),
            //       ),
            //     )),
            SeeMoreDivider(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String subtitle;
  final String content;

  const ActivityCard({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFC),
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(subtitle),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 8),
            Text(content),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.thumb_up_alt_outlined),
                Icon(Icons.mode_comment_outlined),
                Icon(Icons.share_outlined),
                Icon(Icons.send_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Widget leading;
  final String title;
  final List<String> subtitles;

  const InfoCard({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFC),
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: leading,
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var subtitle in subtitles) Text(subtitle),
            if (subtitles.length > 1) const SizedBox(height: 4),
          ],
        ),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}

class SeeMoreDivider extends StatelessWidget {
  const SeeMoreDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "See more",
              style: TextStyle(
                color: Color.fromARGB(255, 29, 97, 231),
              ),
            )),
        Divider()
      ],
    );
  }
}
