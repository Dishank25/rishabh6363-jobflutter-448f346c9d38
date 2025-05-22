import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc State Management/Colleges Names API/Colleges Bloc.dart';
import '../../Bloc State Management/Colleges Names API/Colleges Event.dart';
import '../../Bloc State Management/Colleges Names API/Colleges State.dart';

import '../../Bloc State Management/Courses Names API/Course Bloc.dart';
import '../../Bloc State Management/Courses Names API/Course Event.dart';
import '../../Bloc State Management/Courses Names API/Course State.dart';
import '../../Bloc State Management/Fetch User Basic Details API/Fetch BasicDetails Bloc.dart';
import '../../Bloc State Management/Fetch User Basic Details API/Fetch BasicDetails Event.dart';
import '../../Bloc State Management/Fetch User Basic Details API/Fetch BasicDetails State.dart';

import '../../Bloc State Management/Job Location API/Job Locations Bloc.dart';
import '../../Bloc State Management/Job Location API/Job Locations Event.dart';
import '../../Bloc State Management/Job Location API/Job Locations State.dart';

import '../../Bloc State Management/Job Roles API/Job Role Bloc.dart';
import '../../Bloc State Management/Job Roles API/Job Role Event.dart';
import '../../Bloc State Management/Job Roles API/Job Role State.dart';

import '../../Bloc State Management/Specialization API/Specialization Bloc.dart';
import '../../Bloc State Management/Specialization API/Specialization Event.dart';
import '../../Bloc State Management/Specialization API/Specialization State.dart';

import '../../UI_Helper/UI_Helper.dart';
import '../../Widgets/widgets.dart';
import 'SignUp_Page_Your_Skills.dart';

class SignupAsAnyOne extends StatefulWidget {


  @override
  State< SignupAsAnyOne> createState() => _SignInPageUniversityStudentState();
}

class _SignInPageUniversityStudentState extends State< SignupAsAnyOne> {

  String? selectedOption;
  String? selectedClass;
  String ? selectedCourse;
  TextEditingController totalWorkExp = TextEditingController();


  ///FOR COLLEGE DROPDOWN
  final LayerLink _collegeLayerLink = LayerLink();
  OverlayEntry? _collegeOverLayEntry;
  final GlobalKey _collegeFieldKey = GlobalKey();

  @override
  void dispose() {
    _collegeOverLayEntry?.remove();
    collegeController.dispose();
    super.dispose();
  }
  void _showDropdown() {
    final renderBox = _collegeFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    context.read<CollegeBloc>().add(FetchColleges());

    _collegeOverLayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy ,
        child: CompositedTransformFollower(
          link: _collegeLayerLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            child: BlocBuilder<CollegeBloc, CollegeState>(
              builder: (context, state) {
                if (state is CollegeLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CollegeLoaded) {
                  return ListView(
                    shrinkWrap: true,
                    children: state.colleges.map((name) {
                      return ListTile(
                        visualDensity: VisualDensity(vertical: -4),
                        title: Text(name),
                        onTap: () {
                          collegeController.text = name;
                          _collegeOverLayEntry?.remove();
                          _collegeOverLayEntry = null;
                        },
                      );
                    }).toList(),
                  );
                } else if (state is CollegeError) {
                  return Text(state.message);
                }
                return const SizedBox.shrink();
              },
            )
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_collegeOverLayEntry!);
  }




  /// FOR GENDER DROP DOWN
  final LayerLink _genderLayerLink = LayerLink();
  OverlayEntry? _genderOverlayEntry;
  final GlobalKey _genderKey = GlobalKey();
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  void _toggleGenderDropdown() {
    print("Gender dropdown tapped");
    if (_genderOverlayEntry == null) {
      _genderOverlayEntry = _createGenderOverlay();
      Overlay.of(context).insert(_genderOverlayEntry!);
    } else {
      _genderOverlayEntry?.remove();
      _genderOverlayEntry = null;
    }
  }

  OverlayEntry _createGenderOverlay() {
    if (_genderKey.currentContext == null) {
      debugPrint("genderKey currentContext is null");
      return OverlayEntry(builder: (_) => const SizedBox.shrink()); // or handle appropriately
    }

    final renderBox = _genderKey.currentContext!.findRenderObject();
    if (renderBox is! RenderBox) {
      debugPrint("RenderObject is not a RenderBox");
      return OverlayEntry(builder: (_) => const SizedBox.shrink());
    }

    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height + 5,
        child: CompositedTransformFollower(
          link: _genderLayerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 5),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 100,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: genderOptions.map((option) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16,),
                    title: Text(option),
                    onTap: () {
                      genderController.text = option;
                      _toggleGenderDropdown();
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// FOR SPECIALIZATION DROP DOWN
  final LayerLink _specializationLayerLink = LayerLink();
  OverlayEntry? _specializationOverlayEntry;
  final GlobalKey _specializationKey = GlobalKey();

  void _showSpecializationDropdown() {
    final renderBox = _specializationKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    context.read<SpecializationBloc>().add(FetchSpecializations());

    _specializationOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _specializationLayerLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            child: BlocBuilder<SpecializationBloc, SpecializationState>(
              builder: (context, state) {
                if (state is SpecializationLoading) {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SpecializationLoaded) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: state.specializations.map((name) {
                      return ListTile(
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text(name),
                        onTap: () {
                          specializationController.text = name;
                          _specializationOverlayEntry?.remove();
                          _specializationOverlayEntry = null;
                        },
                      );
                    }).toList(),
                  );
                } else if (state is SpecializationError) {
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

    Overlay.of(context).insert(_specializationOverlayEntry!);
  }

  /// FOR JOB LOCATION DROP DOWN
  final LayerLink _jobLocationLink = LayerLink();
  final GlobalKey _jobLocationFieldKey = GlobalKey();
  OverlayEntry? _jobLocationOverlayEntry;

  void _showJobLocationDropdown() {
    final renderBox = _jobLocationFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    context.read<JobLocationsBloc>().add(FetchJobLocations());

    _jobLocationOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _jobLocationLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: BlocBuilder<JobLocationsBloc, JobLocationsState>(
              builder: (context, state) {
                if (state is JobLocationsLoadingState) {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is JobLocationsLoadedState) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: state.jobLocations.map((location) {
                      return ListTile(
                        dense: true,
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text(location),
                        onTap: () {
                          JobLocationController.text = location;
                          _jobLocationOverlayEntry?.remove();
                          _jobLocationOverlayEntry = null;
                        },
                      );
                    }).toList(),
                  );
                } else if (state is JobLocationsErrorState) {
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

    Overlay.of(context).insert(_jobLocationOverlayEntry!);
  }

  /// FOR JOB ROLES DROP DOWN
  final LayerLink _jobRoleLink = LayerLink();
  final GlobalKey _jobRoleFieldKey = GlobalKey();
  OverlayEntry? _jobRoleOverlayEntry;

  void _showJobRoleDropdown() {
    final renderBox = _jobRoleFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    context.read<JobRoleBloc>().add(FetchJobRoles());

    _jobRoleOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _jobRoleLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: BlocBuilder<JobRoleBloc, JobRoleState>(
              builder: (context, state) {
                if (state is JobRoleLoadingState) {
                  return const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is JobRoleLoadedState) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: state.JobRoles.map((role) {
                      return ListTile(
                        dense: true,
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text(role),
                        onTap: () {
                          jobRoleController.text = role;
                          _jobRoleOverlayEntry?.remove();
                          _jobRoleOverlayEntry = null;
                        },
                      );
                    }).toList(),
                  );
                } else if (state is JobRoleErrorState) {
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

    Overlay.of(context).insert(_jobRoleOverlayEntry!);
  }

  /// TEXT FIELDS USED
  final firstnameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final DOBController = TextEditingController();
  final cityController = TextEditingController();
  final genderController = TextEditingController();
  final collegeController = TextEditingController();
  final specializationController = TextEditingController();
  final startCourseYearController = TextEditingController();
  final endCourseYearController = TextEditingController();
  final startJobYearController = TextEditingController();
  final endJobYearController = TextEditingController();
  final TWXController = TextEditingController();
  final jobRoleController = TextEditingController();
  final currentCompany = TextEditingController();
  final CTCController = TextEditingController();
  final JobLocationController = TextEditingController();


  /// API CALLED TO FETCH BASIC USER DATA
  @override
  void initState() {
    super.initState();
    fetchUserData();
    context.read<CourseBloc>().add(FetchCourses());
    context.read<CollegeBloc>().add(FetchColleges());

  }

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("user_email");
    if (email == null) {
      print("No email found in SharedPreferences.");
    } else {
      print("Retrieved email: $email");
    }//  Email from login screen

    if (email != null && email.isNotEmpty) {
      context.read<FetchUserBloc>().add(FetchUserDetailsEvent(email: email));
    } else {
      print("No email found in SharedPreferences.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FetchUserBloc, FetchUserState>(
        listener: (context, state) {
      print("Listener triggered with state: $state");

      if (state is UserDetailsLoadedState) {
        final user = state.userDetails;
        print("User details received: ${state.userDetails}");

        setState(() {
          firstnameController.text = user.firstName ?? '';
          surnameController.text = user.lastName ?? '';
          emailController.text = user.email ?? '';
          phoneController.text = user.phone ?? '';
        });
      }

      if (state is FetchUserFailedState) {
        print("Failed to fetch user details: ${state.errorMsg}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${state.errorMsg}')),
        );
      }
        },
        /// MAIN UI PERSPECTIVE CODE
        builder: (context, state) {
           return Scaffold(
               appBar: AppBar(
                 title: Text(""),
               ),
               body: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisSize: MainAxisSize.min,
                     children: [

                       /// HEADER
                       Text("Logo", style: mTextStyle15(
                           mColor: Color(0xff032466),
                           mFontWeight: FontWeight.w700),),
                       mSpacer17(),
                       Container(
                         height: 70,
                         width: double.infinity,
                         child: Text("Let's get started! ",
                           style: mTextStyle32(mColor: Color(0xff1A1C1E)),),
                       ),
                       //  mSpacer17(),
                       // mSpacer(mHeight: 26.0),

                       /// BODY PART
                       Row(
                         children: [
                           Expanded(child: Text(
                             "First Name", style: mTextStyle14(),)),
                           SizedBox(width: 12,),
                           Expanded(
                               child: Text("Last Name", style: mTextStyle14(),))
                         ],
                       ),
                       mSpacer(mHeight: 2.0),
                       Row(
                         children: [
                           Expanded(
                             child: CustomTextField(
                                 controller: firstnameController,
                                 hintText: "Aman"),
                           ),
                           SizedBox(width: 12.0,),
                           Expanded(
                             child: CustomTextField(
                                 controller: surnameController,
                                 hintText: "Gupta"),
                           ),
                         ],
                       ),
                       mSpacer17(),

                       /// EMAIL TEXTFIELD
                       Text("Email", style: mTextStyle14(),),
                       mSpacer(mHeight: 2.0),
                       CustomTextField(controller: emailController,
                           hintText: "amangupta@gmail.com"),
                       mSpacer17(),

                       /// PHONE NUMBER TEXTFIELD
                       Text("Phone Number", style: mTextStyle14(),),
                       CustomTextField(
                           controller: phoneController, hintText: ""),
                       mSpacer17(),

                       /// DATE OF BIRTH TEXTFIELD
                       Text("Date of Birth", style: mTextStyle14(),),
                       CustomTextField(controller: DOBController,
                         hintText: "",
                         suffixIcon: Icons.calendar_month_outlined,
                       onSuffixTap: ()async {
                           DateTime? pickedDate = await showDatePicker(
                             context: context,
                             initialDate: DateTime.now().subtract(
                                 const Duration(days: 365 * 40)),
                             firstDate: DateTime(1960),
                             lastDate: DateTime.now(),
                           );

                           if (pickedDate != null) {
                             // Format the picked date (e.g., dd-MM-yyyy)
                             String formattedDate = "${pickedDate.day.toString()
                                 .padLeft(2, '0')}-${pickedDate.month.toString()
                                 .padLeft(2, '0')}-${pickedDate.year}";
                             DOBController.text = formattedDate;
                           };
                       }
                           ),
                       mSpacer17(),

                       /// CURRENT CITY TEXT FIELD
                       Text("Current City", style: mTextStyle14(),),
                       CustomTextField(
                           controller: cityController, hintText: ""),
                       mSpacer17(),

                       /// JOB LOCATION TEXTFIELD
                       Text("Preferred Job Location", style: mTextStyle14(),),
                       CompositedTransformTarget(
                         link: _jobLocationLink,
                         child: CustomTextField(
                           key: _jobLocationFieldKey,
                           controller: JobLocationController,
                           hintText: "Select Preferred Job Location",
                           suffixIcon: Icons.keyboard_arrow_down_outlined,
                           onSuffixTap: () {
                             if (_jobLocationOverlayEntry == null) {
                               _showJobLocationDropdown();
                             } else {
                               _jobLocationOverlayEntry?.remove();
                               _jobLocationOverlayEntry = null;
                             }
                           },
                         ),
                       ),
                       mSpacer17(),

                       /// GENDER TEXTFIELD
                       Text("Gender", style: mTextStyle14(),),
                       CompositedTransformTarget(
                         link:  _genderLayerLink,
                         child: Container(
                           key: _genderKey,
                           child: CustomTextField(controller: genderController,
                             hintText: "",
                             suffixIcon: Icons.keyboard_arrow_down_outlined,
                           onSuffixTap: _toggleGenderDropdown,),
                         ),
                       ),
                       mSpacer17(),

                       /// USER TYPE
                       Text("Type", style: mTextStyle14(),),
                       Wrap(
                         spacing: 12,        // space between containers horizontally
                         runSpacing: 12,     // space between lines
                         children: [
                           OptionContainer(
                             title: "School Student",
                             imgPath: "assets/Icons/school_student.svg",
                             isSelected: selectedOption == "School Student",
                             onTap: () {
                               setState(() {
                                 selectedOption = "School Student";
                               });
                             },
                           ),
                           OptionContainer(
                             title: "College Student",
                             imgPath: "assets/Icons/College_Student.svg",
                             isSelected: selectedOption == "College Student",
                             onTap: () {
                               setState(() {
                                 selectedOption = "College Student";
                               });
                             },
                           ),
                           OptionContainer(
                             title: "Fresher",
                             imgPath: "assets/Icons/fresher_icon.svg",
                             isSelected: selectedOption == "Fresher",
                             onTap: () {
                               setState(() {
                                 selectedOption = "Fresher";
                               });
                             },
                           ),
                           OptionContainer(
                             title: "Working Professional",
                             imgPath: "assets/Icons/working-professional.svg",
                             isSelected: selectedOption == "Working Professional",
                             onTap: () {
                               setState(() {
                                 selectedOption = "Working Professional";
                               });
                             },
                           ),
                         ],
                       ),
                       SizedBox(height: 3),
                       mSpacer(mHeight: 25.0),

                                                                          /// FOR OPTION USER TYPE: SCHOOL STUDENT
                       if(selectedOption == "School Student")
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Standard", style: mTextStyle12()),
                             const SizedBox(height: 8),
                             Wrap(
                               spacing: 12,     // horizontal spacing between OptionContainers
                               runSpacing: 8,   // vertical spacing between rows
                               children: [
                                 OptionContainer(
                                     title: "Class XII",
                                     imgPath: "",
                                 isSelected: selectedClass == "Class XII",
                                   onTap: () {
                                     setState(() {
                                       selectedClass = "Class XII";
                                     });
                                   },),
                                 OptionContainer(
                                     title: "Class XI",
                                     imgPath: "",
                                   isSelected: selectedClass == "Class XI",
                                   onTap: () {
                                     setState(() {
                                       selectedClass = "Class XI";
                                     });
                                   },
                                 ),
                                 OptionContainer(
                                     title: "Class X or below",
                                   isSelected: selectedClass == "Class X or below",
                                   onTap: () {
                                     setState(() {
                                       selectedClass = "Class X or below";
                                     });
                                   },
                                 ),
                               ],
                             ),
                             mSpacer(mHeight: 25.0),
                           ],
                         ),

                                                              /// FOR OPTION USER TYPE: COLLEGE STUDENT OR FRESHER
                       if(selectedOption == "College Student" || selectedOption == "Fresher")

                       /// COURSES OPTIONS
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Course", style: mTextStyle14(),),
                             Padding(
                               padding: const EdgeInsets.only(right: 11.0),
                               child: BlocBuilder<CourseBloc, CourseState>(
                                 builder: (context, state) {
                                   if (state is CourseLoading) {
                                     return CircularProgressIndicator();
                                   } else if (state is CourseLoaded) {
                                     return Wrap(
                                       spacing: 8,
                                       runSpacing: 8,
                                       children: state.courses.map((course) {
                                         return OptionContainer(
                                          title: course.title,
                                        isSelected: selectedCourse == course.title, onTap: () {
                                         setState(() {
                                           selectedCourse = course.title;
                                         });
                                     },); }).toList(),
                                     );}
                                   else if (state is CourseError) {
                                     return Text('Error: ${state.message}');
                                   } else {
                                     return SizedBox.shrink();
                                   }
                                 }
                               ),
                             ),
                             mSpacer(),

                             /// COLLEGES DETAILS
                             Text("College Name", style: mTextStyle14(),),
                             CompositedTransformTarget(
                               link: _collegeLayerLink,
                               child: Container(
                                 key: _collegeFieldKey,
                                 child: CustomTextField(controller: collegeController, /// College Textfield
                                   hintText: "College Name",
                                   suffixIcon: Icons.keyboard_arrow_down_outlined,
                                 onSuffixTap: (){
                                   print("Suffix tapped");
                                   if (_collegeOverLayEntry == null) {
                                     _showDropdown();
                                   } else {
                                     _collegeOverLayEntry?.remove();
                                     _collegeOverLayEntry = null;
                                   }},),
                               ),
                             ),
                             mSpacer17(),

                             /// SPECIALIZATION DETAILS
                             Text("Specialization", style: mTextStyle14(),),
                             CompositedTransformTarget(
                               link: _specializationLayerLink,
                               child: CustomTextField(
                                 key: _specializationKey,
                                 controller: specializationController,
                                 hintText: "Select Specialization",
                                 suffixIcon: Icons.keyboard_arrow_down_outlined,
                                 onSuffixTap: () {
                                   if (_specializationOverlayEntry == null) {
                                     _showSpecializationDropdown();
                                   } else {
                                     _specializationOverlayEntry?.remove();
                                     _specializationOverlayEntry = null;
                                   }
                                 },
                               ),
                             ),
                             mSpacer17(),

                             Row(                /// Start year and end year text row
                               children: [
                                 Text("Start Year", style: mTextStyle14(),),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 100.0),
                                   child: Text("End Year", style: mTextStyle14(),),
                                 )
                               ],
                             ),
                             mSpacer(mHeight: 2.0),

                             ///  College Start year and End year textfield
                             Row(
                               children: [
                                 SizedBox(
                                   width: 160,
                                   child: DatePickerField(controller: startCourseYearController),
                                 ),
                                 Spacer(),
                                 SizedBox(
                                   width: 160,
                                   child:DatePickerField(controller: endCourseYearController),
                                 ),
                               ],
                             )
          ]
          ),
                      /// WHEN USER TYPE : WORKING PROFESSIONAL
                       if(selectedOption == "Working Professional")
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                // mSpacer(mHeight: 20.0),
                                 Row(
                                   children: [
                                     Text("Total Work Experience ",
                                       style: mTextStyle14(),),
                                     Text("*", style: TextStyle(color: Colors.red),)
                                   ],
                                 ),

                             /// Total Working experience textfield
                             CustomTextField(controller:totalWorkExp ,
                               hintText: "Select Experience",
                               suffixIcon: Icons.keyboard_arrow_down_outlined,),
                             mSpacer17(),
                             Row(
                               children: [
                                 Text(
                                   "Current Job Role", style: mTextStyle14(),),
                                 Text("*", style: TextStyle(color: Colors.red),)
                               ],
                             ),

                             /// Job role textfield
                                 CompositedTransformTarget(
                                   link: _jobRoleLink,
                                   child: Container(
                                     key: _jobRoleFieldKey,
                                     child: CustomTextField(
                                       key: _jobRoleFieldKey,
                                       controller: jobRoleController,
                                       hintText: "Select Job Role",
                                       suffixIcon: Icons.keyboard_arrow_down_outlined,
                                       onSuffixTap: () {
                                         print("Suffix icon tapped");
                                         if (_jobRoleOverlayEntry == null) {
                                           _showJobRoleDropdown();
                                         } else {
                                           _jobRoleOverlayEntry?.remove();
                                           _jobRoleOverlayEntry = null;
                                         }
                                       },
                                     ),
                                   ),
                                 ),
                             mSpacer17(),
                                 Row(
                               children: [
                                 Text(
                                   "Current Company", style: mTextStyle14(),),
                                 Text("*", style: TextStyle(color: Colors.red),)
                               ],
                             ),
                             CustomTextField(controller: currentCompany,  /// Current Company Textfield
                               hintText: "Current Company",
                               /*suffixIcon: Icons.keyboard_arrow_down_outlined,*/),
                             mSpacer17(),

                             /// Start year and end year columns
                             Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text("Start Year", style: mTextStyle14(),),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 100.0),
                                   child: Text("End Year", style: mTextStyle14(),),
                                 )
                               ],
                             ),
                             mSpacer(mHeight: 2.0),
                                 Row(
                                   children: [
                                     SizedBox(
                                       width: 160,
                                       child: DatePickerField(controller: startJobYearController),
                                     ),
                                     Spacer(),
                                     SizedBox(
                                       width: 160,
                                       child: DatePickerField(controller: endJobYearController),
                                     ),
                                   ],
                                 ),
                             mSpacer17(),
                             Text("Current or Latest annual Salary/CTC ",
                               style: mTextStyle14(),),
                             SizedBox(height: 3,),
                             Text(
                               "We will use this to find jobs matching/ exceeding your  current salary range.This information is not visible to employers.",
                               style: TextStyle(fontSize: 11),),
                             SizedBox(height: 2,),
                             CustomTextField(controller: CTCController,
                                 hintText: "E.g 4,00,000"),

                           ],

                         ),

                       mSpacer(mHeight: 25.0),
                       /// END PART
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           nextButton(title: "Next", onTap: () {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) =>
                                     SignupPageYourSkills(
                                       firstName:firstnameController.text,
                                       surName: surnameController.text,
                                       email: emailController.text,
                                       phoneNumber: phoneController.text,
                                       DOB: DOBController.text,
                                       currentLocation: cityController.text,
                                       jobPreferenceLocation:  JobLocationController.text,
                                       gender: genderController.text,
                                       userCategory:selectedOption ,
                                       course: selectedCourse,
                                       currentJobRole: jobRoleController.text,
                                       CollegeName: collegeController.text,
                                       Specialization: specializationController.text,
                                       courseStartYear: startCourseYearController.text,
                                       courseEndYear: endCourseYearController.text,
                                       currentCompany: currentCompany.text,
                                       jobStartYear: startJobYearController.text,
                                       jobEndYear: endJobYearController.text,
                                       studentClass: selectedClass,
                                       totalWorkExp: totalWorkExp.text,

                                     )));
                           }),
                         ],
                       ),
          mSpacer(mHeight: 25.0),
                       ]
                 ),



                 )
                 ),


               );


         }
    );

  }
}

/// Drop down for years
class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const DatePickerField({
    required this.controller,
    this.hintText = 'Select Date',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:TextStyle(fontSize: 13, color: Colors.grey),
        suffixIcon: const Icon(Icons.calendar_today, size: 16,),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime(2100),
        );

        if (picked != null) {
          controller.text = '${picked.day} ${_monthName(picked.month)} ${picked.year}';
        }
      },
    );
  }

  String _monthName(int month) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
  }
}