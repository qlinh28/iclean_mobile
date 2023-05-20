import 'package:flutter/material.dart';
import 'component/my_button.dart';
import 'component/my_textfield.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // List<Province> provinces = [];
  // List<District> districts = [];
  final _formKey = GlobalKey<FormState>();
  bool initDateTime = false;

  @override
  void initState() {
    super.initState;
    //fetchProvinces();
  }

  // Future<void> _signUpUser() async {
  //   final response = await AccountAPI.createNewAccount(
  //       usernameController.text,
  //       passwordController.text,
  //       _selectedRole!.toLowerCase(),
  //       _selectedDate!.toIso8601String(),
  //       emailController.text,
  //       fullnameController.text,
  //       _selectedGender!.toLowerCase(),
  //       phoneController.text,
  //       addressController.text,
  //       int.parse(_selectedDistrict!));

  //   if (response == 202) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: Text('Success!'),
  //         content: Text('Create new account successfully!!!.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: Text('Failed'),
  //         content: Text('Username is already existed!!'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  // Future<void> fetchProvinces() async {
  //   final listProvinces = await AccountAPI.fetchProvinces();
  //   setState(() {
  //     if (listProvinces != null) {
  //       provinces = listProvinces;
  //     } else {}
  //   });
  // }

  // Future<void> fetchDistricts(String provinceId) async {
  //   final listDistricts = await AccountAPI.fetchDistricts(provinceId);
  //   setState(() {
  //     if (listDistricts != null) {
  //       districts = listDistricts;
  //     } else {}
  //   });
  // }

// Define validation function
  String? validatePassword(String? value, String? confirmPassword) {
    if (value!.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateDropdown(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please select a value';
    }
    return null;
  }

  // Define validation email function
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number.';
    }
    if (!RegExp(r'^[+]?[0-9]{10,13}$').hasMatch(value)) {
      return 'Please enter only digits and length >= 10.';
    }
    return null;
  }

  String? validateFullname(String? value) {
    if (value!.isEmpty) {
      return 'Please enter full name.';
    }
    if (!RegExp(r'^[A-Z][a-zA-Z]*((\s)?([A-Z][a-zA-Z]*))*$').hasMatch(value)) {
      return 'Please enter valid name.';
    }
    return null;
  }

  late var usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  String? _selectedGender;
  String? _selectedRole;
  String? _selectedProvince;
  String? _selectedDistrict;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.deepPurple.shade300,
              onPrimary: Colors.white,
              surface: Colors.deepPurple.shade300,
              onSurface: Colors.black,
            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              button: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Let\'s create your account',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Lato',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //username texfield
                  MyTextField(
                    controller: usernameController,
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    text: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  //password texfield
                  MyTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    text: 'Password',
                    obscureText: true,
                    validator: (value) =>
                        validatePassword(value, repasswordController.text),
                  ),

                  const SizedBox(height: 10),

                  //re-password texfield
                  MyTextField(
                    controller: repasswordController,
                    labelText: 'Re-password',
                    hintText: 'Enter your re-password',
                    text: 'Re-password',
                    obscureText: true,
                    validator: (value) =>
                        validatePassword(value, passwordController.text),
                  ),

                  const SizedBox(height: 10),

                  // role dropdown
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Role',
                      hintText: 'Select your role',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Lato',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Lato',
                      ),
                    ),
                    value: _selectedRole,
                    onChanged: (String? value) {
                      _selectedRole = value;
                    },
                    items: <String>['Employee', 'Renter'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    //validator: (value) => validateDropdown(value),
                  ),

                  const SizedBox(height: 10),

                  //fullname textfield
                  MyTextField(
                    controller: fullnameController,
                    labelText: 'Fullname',
                    hintText: 'Enter your full name',
                    text: 'full name',
                    obscureText: false,
                    validator: (value) => validateFullname(value),
                  ),

                  const SizedBox(height: 10),

                  // date of birth textfield
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: TextEditingController(
                            text: _selectedDate == null
                                ? ''
                                : DateFormat('dd/MM/yyyy')
                                    .format(_selectedDate!)),
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Enter your birthday',
                          labelText: 'Day Of Birth',
                          labelStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Lato',
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Lato',
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                              setState(() {
                                initDateTime = true;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.edit_calendar),
                            ),
                          ),
                        ),
                      ),
                      if (_selectedDate == null && initDateTime)
                        const Text(
                          'Please select a date',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // gender dropdown
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      labelText: 'Gender',
                      hintText: 'Select your gender',
                      labelStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Lato',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Lato',
                      ),
                    ),
                    value: _selectedGender,
                    onChanged: (String? value) {
                      _selectedGender = value;
                    },
                    items: <String>['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    //validator: (value) => validateDropdown(value),
                  ),

                  const SizedBox(height: 10),

                  //email textfield
                  MyTextField(
                      controller: emailController,
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      text: 'email',
                      obscureText: false,
                      validator: (value) => validateEmail(value)),

                  const SizedBox(height: 10),

                  //phone textfield
                  MyTextField(
                      controller: phoneController,
                      labelText: 'Phone',
                      hintText: 'Enter your phone',
                      text: 'phone',
                      obscureText: false,
                      validator: (value) => validatePhone(value)),

                  const SizedBox(height: 10),

                  // gender dropdown
                  // DropdownButtonFormField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Province',
                  //     hintText: 'Select your province',
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.grey.shade400),
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.grey.shade200,
                  //   ),
                  //   value: _selectedProvince,
                  //   onChanged: (String? value) async {
                  //     _selectedDistrict = '';

                  //     // Clear the items list
                  //     setState(() {
                  //       districts.clear();
                  //     });
                  //     _selectedProvince = value;
                  //     await fetchDistricts(value!);
                  //     _selectedDistrict = null;
                  //   },
                  //   items: provinces.map((Province province) {
                  //     return DropdownMenuItem<String>(
                  //       value: province.province_id,
                  //       child: Text(province.provinceName),
                  //     );
                  //   }).toList(),
                  //   validator: (value) => validateDropdown(value),
                  // ),

                  const SizedBox(height: 10),

                  // gender dropdown
                  // DropdownButtonFormField(
                  //   decoration: InputDecoration(
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.grey.shade400),
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.grey.shade200,
                  //     labelText: 'District',
                  //     hintText: 'Select your district',
                  //     labelStyle: TextStyle(
                  //       color: Colors.grey[500],
                  //       fontFamily: 'Lato',
                  //     ),
                  //     hintStyle: TextStyle(
                  //       color: Colors.grey[500],
                  //       fontFamily: 'Lato',
                  //     ),
                  //   ),
                  //   value: _selectedDistrict,
                  //   onChanged: (String? value) {
                  //     _selectedDistrict = value;
                  //   },
                  //   items: districts.map((District district) {
                  //     return DropdownMenuItem<String>(
                  //       value: district.district_id,
                  //       child: Text(district.districtName),
                  //     );
                  //   }).toList(),
                  //   validator: (value) => validateDropdown(value),
                  // ),

                  const SizedBox(height: 10),

                  //phone textfield
                  MyTextField(
                    controller: addressController,
                    labelText: 'Address',
                    hintText: 'Enter your address',
                    text: 'address',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  MyButton(
                    text: "Sign up",
                    onTap: () {
                      // if (_formKey.currentState != null &&
                      //     _formKey.currentState!.validate()) {
                      //   _signUpUser();
                      // } else {}
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'Lato',
                        ),
                      ),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    ));
  }
}
