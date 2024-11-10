import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_rizal/home/blocs/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  final staffIdC = TextEditingController();
  final nameC = TextEditingController();
  final hobbyC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmPasswordC = TextEditingController();
  bool sPassword = true;
  bool sCPassword = true;
  bool isLoading = false;
  final GlobalKey<FormState> scaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (BuildContext context) => homeBloc,
        child: BlocListener<HomeBloc, HomeState>(
          listener: (BuildContext context, HomeState state) {
            if (state is HomeLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is SubmitSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.message),
                ),
              );
            } else if (state is SubmitError) {
              setState(() {
                isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Form(
            key: scaffoldKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: staffIdC,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        hintText: 'Masukan Staff ID',
                        fillColor: Colors.grey,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Staff ID wajib diisi';
                        }
                        return null;
                      },
                      onChanged: (text) {},
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: nameC,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        hintText: 'Masukan Nama',
                        fillColor: Colors.grey,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama wajib diisi';
                        }
                        return null;
                      },
                      onChanged: (text) {},
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: hobbyC,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                        ),
                        hintText: 'Masukan Hobi',
                        fillColor: Colors.grey,
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      onChanged: (text) {},
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    obscureText: sPassword,
                    controller: passwordC,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      hintText: 'Masukan Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            sPassword = !sPassword;
                          });
                        },
                        icon: Icon(
                          sPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      fillColor: Colors.grey,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password wajib diisi';
                      }
                      return null;
                    },
                    onChanged: (text) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    obscureText: sCPassword,
                    controller: confirmPasswordC,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      hintText: 'Konfirmasi Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            sCPassword = !sCPassword;
                          });
                        },
                        icon: Icon(
                          sCPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      fillColor: Colors.grey,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi Password wajib diisi';
                      }
                      if (passwordC.text != value) {
                        return 'Password Tidak Sama';
                      }
                      return null;
                    },
                    onChanged: (text) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (scaffoldKey.currentState!.validate()) {
                          homeBloc.add(Submit(
                              staffId: staffIdC.text,
                              name: nameC.text,
                              hobby: hobbyC.text,
                              password: passwordC.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
