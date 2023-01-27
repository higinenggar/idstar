import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idstar_users/model/model.dart';
import 'package:idstar_users/page/detail_page.dart';
import 'package:idstar_users/page/homepage.dart';

class GetDataController extends GetxController {
  RxList<GetDataModel> data = <GetDataModel>[].obs;
  RxInt id = 0.obs;

  final isUpdate = false.obs;
  //RxBool upload = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  TextEditingController addNameController = TextEditingController();
  TextEditingController addEmailController = TextEditingController();
  TextEditingController addGenderController = TextEditingController();
  TextEditingController addStatusController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  void getList() async {
    var response = await Dio().get(
      "https://gorest.co.in/public/v2/users",
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization":
              "Bearer a2f0be3e5f06e884a3be3a311c99cc057f68bac6d19166704dcb5eb3b0087e9d",
        },
      ),
    );

    if (response.statusCode == 200) {
      for (var e in response.data) {
        data.add(GetDataModel.fromJson(e));
      }
    }
  }

  void selectUser(int? id) async {
    try {
      var response = await Dio().get(
        "https://gorest.co.in/public/v2/users/$id",
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization":
                "Bearer a2f0be3e5f06e884a3be3a311c99cc057f68bac6d19166704dcb5eb3b0087e9d",
          },
        ),
      );

      if (response.statusCode == 200) {
        nameController.text = response.data['name'];
        emailController.text = response.data['email'];
        genderController.text = response.data['gender'];
        statusController.text = response.data['status'];
      }
    } catch (e) {
      // print('errror');
    }
  }

  void toEditPage() async {
    print(id);
    selectUser(id.value);
    Get.to(() => DetailUser());
  }

  void deleteUser(int? id) async {
    isUpdate(true);

    try {
      var response = await Dio().delete(
        "https://gorest.co.in/public/v2/users/$id",
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer a2f0be3e5f06e884a3be3a311c99cc057f68bac6d19166704dcb5eb3b0087e9d",
          },
        ),
      );
      if (response.statusCode == 204) {
        print('berhasil hapus');
        getList();
        update();
        Get.to(() => HomePage());
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  }

  void editUser(int? id) async {
    var json = {
      "name": nameController.text,
      "email": emailController.text,
      "gender": genderController.text,
      "status": statusController.text,
    };
    var response = await Dio().put(
      "https://gorest.co.in/public/v2/users/$id",
      options: Options(
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "Bearer a2f0be3e5f06e884a3be3a311c99cc057f68bac6d19166704dcb5eb3b0087e9d",
        },
      ),
      data: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      print(response.data);
      getList();
      Get.back();
      update();
    } else {
      print('error');
    }
  }

  void addUser(context) async {
    if (addNameController.text == '' ||
        addEmailController.text == '' ||
        addGenderController.text == '' ||
        addStatusController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data masih kosong'),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Color.fromARGB(255, 231, 82, 72),
      ));
    } else {
      var json = {
        "name": addNameController.text,
        "email": addEmailController.text,
        "gender": addGenderController.text,
        "status": addStatusController.text,
      };
      var response = await Dio().post(
        "https://gorest.co.in/public/v2/users/",
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer a2f0be3e5f06e884a3be3a311c99cc057f68bac6d19166704dcb5eb3b0087e9d",
          },
        ),
        data: jsonEncode(json),
      );
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Data berhasil ditambah'),
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Color.fromARGB(255, 231, 82, 72),
        ));
        print(response.data);
        getList();
        update();
        Get.back();
      } else {
        print(response.statusCode);
      }
    }
  }
}
