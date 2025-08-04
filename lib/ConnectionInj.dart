import 'package:get/get.dart';
import 'package:fasd/network_controller.dart';
class ConnectionInj{


static void init(){


  Get.put<NetworkController>(NetworkController(),permanent: true);
}

}