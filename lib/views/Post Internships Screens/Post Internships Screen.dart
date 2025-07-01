import 'package:flutter/material.dart';
import 'package:job_portal/views/Bottom_Nav_Bar/Recruiter_Bottom_Nav_Bar.dart';
import 'package:job_portal/views/recruiter_signup/presentation/views/Recruiter_Dashboard.dart';
import 'package:job_portal/ui_helper/ui_helper.dart';
import 'package:job_portal/widgets/widgets.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class PostInternshipsScreen extends StatefulWidget {
  const PostInternshipsScreen({super.key});

  @override
  State<PostInternshipsScreen> createState() => _PostInternshipsScreenState();
}

class _PostInternshipsScreenState extends State<PostInternshipsScreen> {
  int? selectedJobIndex; // 0 = Low, 1 = Medium, 2 = High
  int? selectedLocationIndex;
  int? selectedTimingIndex;
  int? selectedStartTimingIndex;
  int? selectedStipendIndex;
  int? selectedStipendBasisIndex;
  int? selectedIncentiveBasisIndex;
  bool isChecked = false;
  bool isPPO = false;
  bool isSelectedCity = false;
  int selectedDay = -1;
  bool isWomenAllowed = false;

  final List<String> JobTypes = ["Internships", "Jobs"];
  final List<String> internshipLocationTypes = [
    "In Office",
    "Hybrid",
    "Remote"
  ];
  final List<String> internshipDayTimingsTypes = ["Part-time", "Full-time"];
  final List<String> internshipStartTimingsTypes = [
    "Immediately (Within 30 days)",
    "Custom"
  ];
  final List<String> stipendTypes = ["Paid", "Unpaid"];
  final List<String> stipendBasis = ["/Weekly", "/Monthly", "Lump-sum"];
  final List<String> IncentivesBasis = ["/Weekly", "/Monthly", "Lump-sum"];
  final List<int> days = [1, 2, 3, 4, 5];

  final List<String> options = [
    "Certificate",
    "Letter of recommendation",
    "Flexible work hours",
    "5 days a week",
    "Informal dress code",
    "Free snacks & beverages"
  ];

  final List<String> JobPerks = [
    "5 days a week",
    "Health Insurance",
    "Life Insurance"
  ];

  List<bool> isTicked = [false, false, false, false, false, false];
  List<bool> isClicked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(""),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Logo",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.mainIndigoColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Post internships jobs",
                      style: mTextStyle32(mColor: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Hire early talent with work experience up to 2 years",
                      style: mTextStyle12(mFontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    /// CheckBox Row (Opportunity type)
                    Text(
                      "Opportunity Type",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(JobTypes.length, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                RoundCheckBox(
                                  size: 22,
                                  isChecked: selectedJobIndex == index,
                                  onTap: (selected) {
                                    setState(() {
                                      selectedJobIndex =
                                          selected! ? index : null;
                                    });
                                  },
                                  checkedColor: Colors.blue,
                                  uncheckedColor: Colors.white,
                                  checkedWidget: Icon(Icons.check,
                                      size: 15, color: Colors.white),
                                ),
                                const SizedBox(width: 6),
                                Text(JobTypes[index], style: mTextStyle12()),
                                // const SizedBox(height: 6),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    /// Profile TEXT FIELD
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      selectedJobIndex == 0
                          ? "InternShip Profile"
                          : "Job Profile",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                      controller: InternshipProfileController,
                      hintText: "E.g Digital Marketing",
                      fillColor: Color(0xffFFF7FB),
                    ),

                    ///Skills required TEXT FIELD
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Skills Required",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                      controller: SkillsRequiredController,
                      hintText: "E.g SEO",
                      fillColor: Color(0xffFFF7FB),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    /// CheckBox Row (Internship type)
                    Text(
                      selectedJobIndex == 0 ? "InternShip type" : "Job type",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),

                      /// Logic for job location: In-office/ Hybrid
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(internshipLocationTypes.length,
                            (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                RoundCheckBox(
                                  size: 22,
                                  isChecked: selectedLocationIndex == index,
                                  onTap: (selected) {
                                    setState(() {
                                      selectedLocationIndex =
                                          selected! ? index : null;
                                    });
                                  },
                                  checkedColor: Colors.blue,
                                  uncheckedColor: Colors.white,
                                  checkedWidget: Icon(Icons.check,
                                      size: 15, color: Colors.white),
                                ),
                                const SizedBox(width: 6),
                                Text(internshipLocationTypes[index],
                                    style: mTextStyle12()),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    if (selectedLocationIndex == 0)
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "City/Cities",
                              style: mTextStyle12(),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            CustomTextField(
                              controller: cityController,
                              hintText: "E.g Mumbai",
                              fillColor: Color(0xffFFF7FB),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isSelectedCity,
                                  onChanged: (value) {
                                    setState(() {
                                      isSelectedCity = value!;
                                    });
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Candidates from ONLY the above city should be\n allowed to apply.',
                                  style: mTextStyle12(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    if (selectedLocationIndex == 1)
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "No.of in-office days in a week:",
                                style: mTextStyle12(),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Wrap(
                                spacing: 12,
                                children: days.map((day) {
                                  return ChoiceChip(
                                    label: Text(
                                      day.toString(),
                                      style: mTextStyle12(),
                                    ),
                                    selected: selectedDay == day,
                                    onSelected: (_) {
                                      setState(() {
                                        selectedDay = day;
                                      });
                                    },
                                    selectedColor: Colors.blue.shade100,
                                    backgroundColor: Colors.grey.shade100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: selectedDay == day
                                            ? Colors.blue
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                      color: selectedDay == day
                                          ? Colors.blue.shade800
                                          : Colors.black,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ]),
                      ),
                    SizedBox(
                      height: 20,
                    ),

                    /// CheckBox Row (Internship Daily Timing type)
                    Text(
                      "Part time/ Full time",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            internshipDayTimingsTypes.length, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                RoundCheckBox(
                                  size: 22,
                                  isChecked: selectedTimingIndex == index,
                                  onTap: (selected) {
                                    setState(() {
                                      selectedTimingIndex =
                                          selected! ? index : null;
                                    });
                                  },
                                  checkedColor: Colors.blue,
                                  uncheckedColor: Colors.white,
                                  checkedWidget: Icon(Icons.check,
                                      size: 15, color: Colors.white),
                                ),
                                const SizedBox(width: 6),
                                Text(internshipDayTimingsTypes[index],
                                    style: mTextStyle12()),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    /// CheckBox Row (Internship Joining Timing type)
                    Text(
                      "Internship start date",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            internshipStartTimingsTypes.length, (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                RoundCheckBox(
                                  size: 22,
                                  isChecked: selectedStartTimingIndex == index,
                                  onTap: (selected) {
                                    setState(() {
                                      selectedStartTimingIndex =
                                          selected! ? index : null;
                                    });
                                  },
                                  checkedColor: Colors.blue,
                                  uncheckedColor: Colors.white,
                                  checkedWidget: Icon(Icons.check,
                                      size: 15, color: Colors.white),
                                ),
                                const SizedBox(width: 6),
                                Text(internshipStartTimingsTypes[index],
                                    style: mTextStyle12()),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    if (selectedStartTimingIndex == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "From",
                                  style: mTextStyle12(),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  "To",
                                  style: mTextStyle12(),
                                ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: startDateController,
                                    hintText: "Start Date ",
                                    fillColor: Color(0xffFFF7FB),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: CustomTextField(
                                    controller: endDateController,
                                    hintText: "End Date ",
                                    fillColor: Color(0xffFFF7FB),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    /// Internship duration text field
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Internship duration",
                      style: mTextStyle12(),
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 240,
                            child: CustomTextField(
                              controller: internshipDurationController,
                              hintText: "Choose Duration",
                              suffixIcon: Icons.keyboard_arrow_down,
                              onSuffixTap: () {},
                              fillColor: Color(0xffFFF7FB),
                            )),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                            child: CustomTextField(
                                controller: internshipDurationMonthsController,
                                hintText: "Months",
                                suffixIcon: Icons.keyboard_arrow_down,
                                onSuffixTap: () {},
                                fillColor: Color(0xffFFF7FB)))
                      ],
                    ),

                    /// Number of opening text field
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Number of Openings",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                      controller: no_openingController,
                      hintText: "E.g 4",
                      fillColor: Color(0xffFFF7FB),
                    ),

                    /// Intern's Responsibility text field
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      selectedJobIndex == 0
                          ? "Intern's Responsibility"
                          : "Job's Responsibility",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: responsibilitiesController,
                      maxLines: 10,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Enter preferences (one per line)",
                        hintStyle: mTextStyle12(
                            mFontWeight: FontWeight.w500,
                            mColor: Colors.grey.shade400),
                        filled: true,
                        fillColor: const Color(0xffFFF7FB),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Colors
                                  .grey.shade300), // Change color as needed
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    /// Additional Candidates Preferences text field
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Additional Candidates Preferences",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: preferencesController,
                      maxLines: 4,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Enter preferences (one per line)",
                        hintStyle: mTextStyle12(
                            mFontWeight: FontWeight.w500,
                            mColor: Colors.grey.shade400),
                        filled: true,
                        fillColor: const Color(0xffFFF7FB),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 1,
                              color: Colors
                                  .grey.shade300), // Change color as needed
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isWomenAllowed,
                          onChanged: (value) {
                            setState(() {
                              isWomenAllowed = value!;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Text(
                            "Allow applications from women who are willing to \nstart/restart their career.",
                            style: mTextStyle12(),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    /// Stipend CheckBox Row
                    if (selectedJobIndex == 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Stipend",
                            style: mTextStyle12(),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            height: 46,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  List.generate(stipendTypes.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      RoundCheckBox(
                                        size: 22,
                                        isChecked:
                                            selectedStipendIndex == index,
                                        onTap: (selected) {
                                          setState(() {
                                            selectedStipendIndex =
                                                selected! ? index : null;
                                          });
                                        },
                                        checkedColor: Colors.blue,
                                        uncheckedColor: Colors.white,
                                        checkedWidget: Icon(Icons.check,
                                            size: 15, color: Colors.white),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(stipendTypes[index],
                                          style: mTextStyle12()),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),

                    /// Conditional code for fixed pay in case of opportunity type- JOBS
                    if (selectedJobIndex == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fixed pay(per year)",
                                  style: mTextStyle12(),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: CustomTextField(
                                            controller: minSalaryController,
                                            hintText: "Min.Salary",
                                            fillColor: Color(0xffFFF7FB))),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                        child: CustomTextField(
                                            controller: maxSalaryController,
                                            hintText: "Max.Salary",
                                            fillColor: Color(0xffFFF7FB))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),

                    /// Conditional code for fixed pay in case of opportunity type- Internships
                    if (selectedJobIndex == 0 && selectedStipendIndex == 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fixed Stipend",
                            style: mTextStyle12(),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 170,
                                  child: CustomTextField(
                                    controller: minStipendController,
                                    hintText: "min. Stipend",
                                    fillColor: Color(0xffFFF7FB),
                                  )),
                              SizedBox(
                                  width: 170,
                                  child: CustomTextField(
                                    controller: maxStipendController,
                                    hintText: "max. Stipend",
                                    fillColor: Color(0xffFFF7FB),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(stipendBasis.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  children: [
                                    RoundCheckBox(
                                      size: 22,
                                      isChecked:
                                          selectedStipendBasisIndex == index,
                                      onTap: (selected) {
                                        setState(() {
                                          selectedStipendBasisIndex =
                                              selected! ? index : null;
                                        });
                                      },
                                      checkedColor: Colors.blue,
                                      uncheckedColor: Colors.white,
                                      checkedWidget: Icon(Icons.check,
                                          size: 15, color: Colors.white),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(stipendBasis[index],
                                        style: mTextStyle12()),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),

                    if (selectedStipendIndex == 0)
                      Row(
                        children: [
                          Text(
                            selectedJobIndex == 1
                                ? "Variables/Incentives(per year)"
                                : "Incentives",
                            style: mTextStyle12(),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    if (selectedJobIndex == 0 && selectedStipendIndex == 0 ||
                        selectedJobIndex == 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CustomTextField(
                            controller: minIncentivesController,
                            hintText: "min. Incentive",
                            fillColor: Color(0xffFFF7FB),
                          )),
                          SizedBox(width: 18),
                          Expanded(
                              child: CustomTextField(
                            controller: maxStipendController,
                            hintText: "max. Incentive",
                            fillColor: Color(0xffFFF7FB),
                          ))
                        ],
                      ),
                    if (selectedJobIndex == 0 && selectedStipendIndex == 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                              List.generate(IncentivesBasis.length, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  RoundCheckBox(
                                    size: 22,
                                    isChecked:
                                        selectedIncentiveBasisIndex == index,
                                    onTap: (selected) {
                                      setState(() {
                                        selectedIncentiveBasisIndex =
                                            selected! ? index : null;
                                      });
                                    },
                                    checkedColor: Colors.blue,
                                    uncheckedColor: Colors.white,
                                    checkedWidget: Icon(Icons.check,
                                        size: 15, color: Colors.white),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(IncentivesBasis[index],
                                      style: mTextStyle12()),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Perks, select all that includes",
                      style: mTextStyle12(
                          mColor: Colors.black.withOpacity(0.6),
                          mFontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    selectedJobIndex == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(options.length, (index) {
                              return Row(children: [
                                Checkbox(
                                  value: isTicked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      isTicked[index] = value!;
                                    });
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  options[index],
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade700),
                                ),
                              ]);
                            }),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(JobPerks.length, (index) {
                              return Row(
                                children: [
                                  Checkbox(
                                    value: isClicked[index],
                                    onChanged: (value) {
                                      setState(() {
                                        isClicked[index] = value!;
                                      });
                                    },
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity(
                                        horizontal: -4, vertical: -4),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    JobPerks[index],
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey.shade700),
                                  )
                                ],
                              );
                            }),
                          ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        RoundCheckBox(
                          size: 22,
                          isChecked: isPPO,
                          onTap: (selected) {
                            setState(() {
                              isPPO = !isPPO;
                            });
                          },
                          checkedColor: Colors.blue,
                          uncheckedColor: Colors.white,
                          checkedWidget:
                              Icon(Icons.check, size: 15, color: Colors.white),
                        ),
                        const SizedBox(width: 6),
                        Text(
                            "Does this internship come with a pre-placement offer\n (PPO)?",
                            style:
                                mTextStyle12(mColor: AppColors.blueTextColor)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Screening Questions",
                      style: mTextStyle14(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Availability (Default)",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade300)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Text(
                          "Please confirm your availability for this internship. If not available immediately, how early would you be able to join?",
                          style: mTextStyle12(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "+ Add more questions (Optional) ",
                          style: mTextStyle12(mColor: AppColors.blueTextColor),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Alternate phone number for this listing (Optional)",
                      style: mTextStyle12(),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    CustomTextField(
                      controller: alterPhoneController,
                      hintText: "+91- 9977665543",
                      fillColor: Color(0xffFFF7FB),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff6C7278))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Icon(Icons.arrow_back, size: 16,),
                                Text(
                                  "Stay Draft",
                                  style: mTextStyle14(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        nextButton(
                            title: "Post Internship",
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "InternShip Posted Successfully!!!")));

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecruiterBottomNavBar()));
                            })
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )));
  }
}
