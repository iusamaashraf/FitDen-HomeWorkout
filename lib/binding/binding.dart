import 'package:fitden_homeworkout/controllers/user_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<UserController>(UserController());
    // Get.put<GuardsandMemberController>(GuardsandMemberController());
    //Get.put<IncidentCallController>(IncidentCallController());
  }
}