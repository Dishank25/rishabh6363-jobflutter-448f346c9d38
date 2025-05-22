import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc State Management/Domain Skills API/DomainSkills Bloc.dart';
import '../../Bloc State Management/Domain Skills API/DomainSkills Event.dart';
import '../../Bloc State Management/Domain Skills API/DomainSkills State.dart';
import '../../Bloc State Management/Related Skills API/Related Skills Bloc.dart';
import '../../Bloc State Management/Related Skills API/Related Skills Event.dart';
import '../../Bloc State Management/Related Skills API/Related Skills State.dart';
import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import 'SignUp_Page_Your_preferences.dart';

class SignupPageYourSkills extends StatefulWidget {
  String firstName;
  String surName;
  String gender;
  String DOB;
  String phoneNumber;
  String email;
  String jobPreferenceLocation;
  String currentLocation;
  String ? userCategory;
  String totalWorkExp;
  String currentJobRole;
  String currentCompany;
  String jobStartYear;
  String jobEndYear;
  String ? studentClass;
  String ? course;
  String CollegeName;
  String Specialization;
  String courseStartYear;
  String courseEndYear;
   SignupPageYourSkills({required this.firstName,required this.surName, required this.email, required this.currentCompany, required this.CollegeName,
    this.course, required this.courseEndYear, required this.courseStartYear, required this.currentJobRole, required this.currentLocation,
   required this.DOB, required this.gender, required this.jobEndYear, required this.jobPreferenceLocation,
   required this.jobStartYear, required this.Specialization, this.studentClass, required this.totalWorkExp, this.userCategory,
   required this.phoneNumber});

  @override
  State<SignupPageYourSkills> createState() => _SignupPageYourSkillsState();
}

class _SignupPageYourSkillsState extends State<SignupPageYourSkills> {

  TextEditingController skillsSearchController = TextEditingController();
  String ? token;


  /// Domain Skills Drop Down
  final LayerLink _domainLink = LayerLink();
  final GlobalKey _domainFieldKey = GlobalKey();
  OverlayEntry? _domainOverlayEntry;

  void _showDomainDropdown(BuildContext context, TextEditingController controller) {
    final renderBox = _domainFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    context.read<DomainBloc>().add(FetchDomains());

    _domainOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _domainLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: BlocBuilder<DomainBloc, DomainState>(
              builder: (context, state) {
                if (state is DomainLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is DomainLoaded) {
                  return ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: state.domains.map((domain) {
                      return ListTile(
                        dense: true,
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text(domain.domainName),
                        onTap: () {
                          controller.text = domain.domainName;

                          // Trigger related skills fetch
                          context.read<RelatedSkillsBloc>().add(FetchRelatedSkills(domain.domainName));

                          _domainOverlayEntry?.remove();
                          _domainOverlayEntry = null;
                        },
                      );
                    }).toList(),
                  );
                } else if (state is DomainError) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(state.message),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_domainOverlayEntry!);
  }
  @override
  void dispose() {
    // Ensure any active overlay is removed to prevent _dependents assertion error
    _domainOverlayEntry?.remove();
    _domainOverlayEntry = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  void _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// HEADER
            Text(
              "Logo",
              style: mTextStyle15(
                mColor: Color(0xff032466),
                mFontWeight: FontWeight.w700,
              ),
            ),
            mSpacer17(),
            Container(
              height: 42,
              width: double.infinity,
              child: Text(
                "Your Skills",
                style: mTextStyle32(mColor: Color(0xff1A1C1E)),
              ),
            ),
            Text(
              "Help us match you with the best career opportunities",
              style: mTextStyle12(),
            ),
            mSpacer(mHeight: 25.0),
            SizedBox(height: 3),
            mSpacer(mHeight: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Areas of Interest", style: mTextStyle14()),
                CompositedTransformTarget(
                  link: _domainLink,
                  child: CustomTextField(
                    key: _domainFieldKey,
                    controller: skillsSearchController,
                    hintText: "Select Area of Interest",
                    suffixIcon: Icons.keyboard_arrow_down_outlined,
                    onSuffixTap: () {
                      if (_domainOverlayEntry == null) {
                        _showDomainDropdown(context, skillsSearchController);
                      } else {
                        _domainOverlayEntry?.remove();
                        _domainOverlayEntry = null;
                      }
                    },
                  ),
                ),
                mSpacer(mHeight: 16.0),
                preferenceContainer(cName: "Digital Marketing", onTap: () {}),
                mSpacer(),
                preferenceContainer(cName: "Graphic Design", onTap: () {}),
                mSpacer17(),
                Text("Related skills you might know", style: mTextStyle12()),
                SizedBox(height: 10),
                BlocBuilder<RelatedSkillsBloc, RelatedSkillsState>(
                  builder: (context, state) {
                    if (state is RelatedSkillsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is RelatedSkillsLoaded) {
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: state.skills.map((skill) {
                          return courseName(
                            name: skill.skillName,
                            mIcon: Icons.add,
                          );
                        }).toList(),
                      );
                    } else if (state is RelatedSkillsError) {
                      return Text(state.message,
                          style: TextStyle(color: Colors.red));
                    }
                    return SizedBox.shrink();
                  },
                ),
                SizedBox(height: 6),
                courseName(
                    name: "See More",
                    mIcon: Icons.add,
                    bgColor: Color(0xff1961F3)),
                mSpacer(mHeight: 24.0),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff6C7278)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.arrow_back, size: 16),
                            Text("Back", style: mTextStyle14()),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    nextButton(
                      title: "Next",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPageYourPreferences(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}