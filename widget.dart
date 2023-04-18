import 'package:dp_membership_app/models/dynamic_form_model.dart';
import 'package:dp_membership_app/widgets/back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:dp_membership_app/widgets/app_input_box.dart';
import 'package:get/get.dart';

import '../../main/main_controller.dart';
import '../../web_base_config.dart';
import '../../widgets/checkbox_w_text.dart';
import '../../widgets/fields_section_title.dart';
import '../../widgets/loading.dart';
import '../../widgets/membership_list.dart';
import 'memberships_controller.dart';

class MembershipScreen extends GetView<MainController> {
  MembershipScreen({Key? key}) : super(key: key);
  final MembershipsController membershipController = Get.find<MembershipsController>();

  @override
  Widget build(BuildContext context) {
    // Responsivity calculation
    var scrWidth = MediaQuery.of(context).size.width;
    var widthDivider = 0.0;
    var resultPadding = 0.0;
    var scrHeight = MediaQuery.of(context).size.height;

    if (scrWidth > 1480) {
      widthDivider = 3.0;
    }
    else if ((scrWidth <= 1480) && (scrWidth > 1080)) {
      widthDivider = 4.5;
    }
    else if ((scrWidth <= 1080) && (scrWidth >= 686)) {
      widthDivider = 5;
    }

    if (widthDivider != 0.0) {
      resultPadding = scrWidth / widthDivider;
    }

    return SafeArea(
      child: Scaffold(
        body: Obx(() => Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: OuterClippedPart(),
              child: Container(
                color: Color(controller.selectedPartner.value.appTheme.primaryColor),
                width: scrWidth,
                height: scrHeight,
              ),
            ),
            ClipPath(
              clipper: InnerClippedPart(),
              child: Container(
                color: Color(controller.selectedPartner.value.appTheme.secondaryColor),
                width: scrWidth,
                height: scrHeight,
              ),
            ),
            Align(
              alignment: FractionalOffset.topRight,
              child: Opacity(
                opacity: widthDivider < 3 ? .05 : 1,
                child: SizedBox(
                  width: scrWidth / (widthDivider * 1.65),
                  height: scrWidth / (widthDivider * 1.65),
                  child: Image.network(CONF_LOGO_MD_URL),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(resultPadding, 0, resultPadding, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ------------------------------------------------------- HEADER (LOGO, ETC..)
                        // Title
                        if (['top', 'both'].contains(membershipController.selectedMembership.value.backBtnPlacement)) BackArrow(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 40.0,
                                top: ['top', 'both'].contains(membershipController.selectedMembership.value.backBtnPlacement) ? 10.0 : 40.0
                            ),
                            child: Text(
                              membershipController.selectedMembership.value.title ?? '',
                              style: const TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 35,
                                color: Color(0xff292a25),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            //
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40, top: 5),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: scrWidth * .6),
                              child: Text(
                                membershipController.selectedMembership.value.subtitle ?? '',
                                style: const TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(left: 42, right: 42, top: 42),
                          child: Column(
                            children: [
                              Text(
                                'Teszt Kiss Ferenc',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff292a25),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Kecske',
                                    style: const TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xff292a25),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                    decoration: BoxDecoration(
                                      color: Color(controller.selectedPartner.value.appTheme.primaryColor),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                        'Kecske2',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 14,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Teszt sub',
                                      style: const TextStyle(
                                          color: Color(0xff292a25),
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                  Text(
                                      'Teszt séma',
                                      style: const TextStyle(
                                          color: Color(0xff292a25),
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Divider(
                                height: 40,
                                thickness: 2,
                                color: const Color(0xff292a25).withOpacity(.4),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.redAccent,
                                        width: 4,
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.pause, color: Colors.redAccent, size: 24),
                                        SizedBox(width: 4),
                                        Text(
                                          'LEMOND',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                          'Tartozás',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      Text(
                                          '5000 Ft',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontFamily: 'SourceSansPro',
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),



                        // Fields
                        const SizedBox(
                          height: 50,
                        ),
                        // ------------------------------------------------------- FIELDS
                        if (membershipController.selectedMembership.value.groups == null) const Loading('Profil'),
                        if (membershipController.selectedMembership.value.groups != null) ...[
                          for ( var pGroup in membershipController.selectedMembership.value.groups! ) renderFieldGroup(pGroup, controller.selectedPartner.value.appTheme.primaryColor),
                          GestureDetector(
                            onTap: () {
                              // @TODO NOT IMPLEMENTED WARNING!
                              const snackBar = SnackBar(
                                content: Text('Még nem működik!'),
                              );
                              // Find the ScaffoldMessenger in the widget tree
                              // and use it to show a SnackBar.
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              width: scrWidth * 0.85,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Color(controller.selectedPartner.value.appTheme.secondaryColor),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'Mentés',
                                  style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        if (['top', 'both'].contains(membershipController.selectedMembership.value.backBtnPlacement)) Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: BackArrow(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget renderFieldGroup(DynamicFormGroup pGroup, int primaryColor) {
    return Column(
      children: [
        if (pGroup.displayTitle) FieldsSectionTitle(title: pGroup.name),
        const SizedBox(
          height: 15,
        ),
        renderField(pGroup.fields, primaryColor)
      ],
    );
  }

  Widget renderField(List<DynamicFormField> fields, int primaryColor) {
    return Column(
      children: [
        for ( var pField in fields )
          if (['email', 'text', 'number', 'tel'].contains(pField.type)) Column(
            children: [
              DpInputBox(
                  label: pField.name,
                  inputHint: pField.placeholder,
                  inputVal: ((pField.value != null) && (pField.value != false)) ? pField.value as String : '',
                  focusColorCode: primaryColor,
                onInputChanged: (inputVal) {},
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          )
        else if (pField.type == 'checkbox') Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: CheckboxWText(
                    text: pField.name,
                    color: primaryColor,
                    initialValue: false,
                    onStateChange: (newState) {}
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
        else if (pField.type == 'memberships') Column(
            children: [
              MembershipList(pField),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
      ],
    );
  }
}


class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
