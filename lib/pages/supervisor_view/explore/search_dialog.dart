import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/custom_textfield.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/supervisor_view/explore/controller/pump_house_controller.dart';

void showSearchDialog(BuildContext context, PumpHouseController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: const Color(0xFF1A1A1D),
        title: const GlobalText(
          text: SupervisorText.searchHintText,
          type: TextType.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        content: SizedBox(
          height: 80.h,
          child: Column(
            children: [
              CustomTextField(
                placeholder: SupervisorText.searchHintText,
                onChanged: (value) {
                  controller.search(value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF333333),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),
                  hintText: SupervisorText.searchHintText,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
                textStyle: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              SupervisorText.closeButtonText,
              style: TextStyle(color: Colors.grey[400]),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}