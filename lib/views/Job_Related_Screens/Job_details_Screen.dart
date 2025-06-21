import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_portal/views/Bottom_Nav_Bar/Student_Bottom_Nav_Bar.dart';
import '../../ui_helper/ui_helper.dart';
import '../../widgets/widgets.dart';
import 'Job_Search_Screen.dart';

import 'Company_filtered_jobs.dart';

class JobDetailsScreen extends StatefulWidget {
  final VoidCallback? onCallBack;
  final VoidCallback? onShowCompanyJobs;
  JobDetailsScreen({this.onCallBack, this.onShowCompanyJobs});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// APP BAR
        appBar: buildCustomAppBar(titleText: "LOGO"),

        /// BODY CONTENT
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 93,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Color(0xffEDF1F3), width: 1.0)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 60,
                            width: 54,
                            child: Image.asset("assets/Images/uber.png"),
                          ),
                        ),
                        // SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Digital Marketing Executive",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Uber",
                                style: mTextStyle14(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  greyContainer(
                                      text: 'Actively Hiring',
                                      bgColor: AppColors.mainRedColor),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  greyContainer(
                                      text: "2 weeks ago",
                                      bgColor: Color(0xffEFF0F6))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      jobRelatedOptions(title: "INR 3,00,000"),
                      jobRelatedOptions(title: "1-2 years"),
                      jobRelatedOptions(title: "Mumbai"),
                      jobRelatedOptions(title: "45 Applicants")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Your Role",
                    style: mTextStyle14(mFontWeight: FontWeight.w600),
                  ),
                  Text(
                      "* Create and implement inclusive digital marketing strategies by utilising different digital mediums and setting measurable KPIs.\n* Collaborate with other teams (like content, sales, and customer service) to ensure cohesive and effective marketing campaigns.Manage digital campaigns, monitor performance reports, analyse data, and make data-driven recommendations.\n* Optimise website performance, including organic traffic, bounce rate, and conversion rates to improve user experience and drive lead generation.\n* Conduct market research and competitive analysis to identify industry trends and new growth opportunities. "),
                  SizedBox(
                    height: 11,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About Uber",
                            style: mTextStyle14(mFontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                            onTap: () {
                              if (widget.onShowCompanyJobs != null) {
                                widget.onShowCompanyJobs!();
                              }
                              ;
                            },
                            child: Text("More Job openings at Uber",
                                style: mTextStyle14().copyWith(
                                  color: AppColors.blueTextColor,
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            "At Uber we’re reimagining the way the world moves for the better. That means being bold in our decisions and building for something bigger. For us, all of that starts with helping people go anywhere and get anything. It’s what we know and what we do best.That’s why people want to join us: because our solutions are implemented in real time and on thousands of city streets, they are a boon and a career to people all over the globe. The scope of this work means Uber will challenge you - put you up against complex problems that require ambitious solutions. We need bold people who can build with heart, who will chase solutions with fearless optimism. We are Uber. Are you?"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Applied Successfully")));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Student_Bottom_Nav_bar()));
                      },
                      child: commonRedContainer(text: "Apply")),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

Widget greyContainer({required String text, required Color bgColor}) {
  final Color textColor =
      bgColor == Color(0xffEFF0F6) ? Color(0xff6C7278) : Colors.white;
  return Container(
    width: 100,
    decoration:
        BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(26)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 12, color: textColor),
      )),
    ),
  );
}

Widget jobRelatedOptions({required String title}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Color(0xffEFF0F6), width: 1.0)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Text(title,
            style: TextStyle(
                fontSize: 11,
                color: Color(0xff6C7278),
                fontWeight: FontWeight.w400)),
      ),
    ),
  );
}
