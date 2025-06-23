import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shevaandrii/core/themes/app_colors.dart';
import 'package:shevaandrii/core/themes/app_gap.dart';
import 'package:shevaandrii/core/themes/app_theme.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfileScreen> {
  bool isEditing = false;
  File? _imageFile;

  final nameController = TextEditingController(text: 'Alex Johnson');
  final ageController = TextEditingController(text: '30');
  final hightController = TextEditingController(text: '5 ft 8 in');
  final weightController = TextEditingController(text: '73 kg');
  final targetedController = TextEditingController(text: '63');

  final goalOptions = ['Lose weight', 'Gain muscle', 'Maintain weight'];
  String selectedGoal = 'Lose weight';

  final activityOptions = [
    'Sedentary (Little to no exercise)',
    'Lightly Active (1–2 workouts/week)',
    'Moderately Active (3–4 workouts/week)',
    'Very Active (5-6 workouts/week)',
  ];
  String selectedActivity = 'Lightly Active (1–2 workouts/week)';

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _saveProfile() {
    setState(() {
      isEditing = false;
    });
    // save logic
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.withGradientBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(color: Colors.white),
          title: Text('My Profile', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Gap.h22,
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child:
                          _imageFile != null
                              ? Image.file(_imageFile!, fit: BoxFit.cover)
                              : Image.asset(
                                'assets/images/profilepicture.png',
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 151, 198, 236),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Icon(
                          Icons.image_search_rounded,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap.h12,
              Text(
                nameController.text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap.h12,
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.secondarybackgrounr,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        AnimatedOpacity(
                          opacity: isEditing ? 0.5 : 1.0,
                          duration: Duration(milliseconds: 300),
                          child: SizedBox(
                            height: 40,
                            width: 97,
                            child: GestureDetector(
                              onTap: isEditing ? null : _toggleEdit,
                              child: AbsorbPointer(
                                absorbing: isEditing,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue[400],
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Gap.h12,
                    _buildTextField('Name', nameController, isEditing),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'Age',
                            ageController,
                            isEditing,
                          ),
                        ),
                        Gap.w12,
                        Expanded(
                          child: _buildTextField(
                            'Height',
                            hightController,
                            isEditing,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            'Weight',
                            weightController,
                            isEditing,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildTextField(
                            'Target Weight',
                            targetedController,
                            isEditing,
                          ),
                        ),
                      ],
                    ),
                    Gap.h12,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Goal',
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                    ),

                    Gap.h4,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.profilebackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonFormField<String>(
                        value: selectedGoal,
                        items:
                            goalOptions.map((goal) {
                              return DropdownMenuItem<String>(
                                value: goal,
                                child: Text(
                                  goal,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged:
                            isEditing
                                ? (value) =>
                                    setState(() => selectedGoal = value!)
                                : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        dropdownColor: AppColors.profilebackground,
                      ),
                    ),
                    Gap.h12,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Physical Activity',
                        style: TextStyle(color: AppColors.primaryText),
                      ),
                    ),

                    Gap.h4,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.profilebackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonFormField<String>(
                        value: selectedActivity,
                        items:
                            activityOptions.map((activity) {
                              return DropdownMenuItem<String>(
                                value: activity,
                                child: Text(
                                  activity,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged:
                            isEditing
                                ? (value) =>
                                    setState(() => selectedActivity = value!)
                                : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        dropdownColor: AppColors.profilebackground,
                      ),
                    ),
                    Gap.h22,

                    if (isEditing)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 97,
                            child: OutlinedButton(
                              onPressed:
                                  () => setState(() => isEditing = false),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide.none,
                                foregroundColor: AppColors.primaryText,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Text('Cancel'),
                            ),
                          ),
                          Gap.w8,
                          SizedBox(
                            height: 40,
                            width: 97,
                            child: OutlinedButton(
                              onPressed: _saveProfile,
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.blue[400],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: BorderSide.none,
                                foregroundColor: AppColors.primaryText,
                              ),
                              child: Text('Save'),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Gap.h80,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    bool enabled, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h12,
        Text(label, style: TextStyle(color: AppColors.primaryText)),
        Gap.h4,
        Container(
          decoration: BoxDecoration(
            color: AppColors.profilebackground,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            keyboardType: keyboardType,
            style: TextStyle(color: AppColors.primaryText),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: AppColors.primaryText),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}
