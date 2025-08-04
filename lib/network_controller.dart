import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NetworkController extends GetxController{

final Connectivity _connectivity=Connectivity();

@override
void onInit(){

  super.onInit();
  _connectivity.checkConnectivity().then((result) => _updateConnectionStatus(result));
  _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

}
void _updateConnectionStatus(ConnectivityResult connectivityResult){

  if(connectivityResult==ConnectivityResult.none){
        Get.rawSnackbar(
      messageText: const Text("PLEASE CONNECT TO THE INTERNET"),
     isDismissible: true,

     duration: const Duration(seconds: 3),
     icon: const Icon(Icons.mobiledata_off_outlined) ,
     margin: EdgeInsets.zero,
     snackStyle: SnackStyle.GROUNDED,
    );
  }else {
    if(Get.isSnackbarOpen)
    {
      Get.closeCurrentSnackbar();
    }
  }
}

}