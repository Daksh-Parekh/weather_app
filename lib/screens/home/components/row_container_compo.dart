import 'package:flutter/material.dart';
import 'package:weather_app/utils/extension/app_extension.dart';

Widget rowsContainer(
    {required String key,
    required String values,
    required IconData icons,
    required Size size}) {
  return Expanded(
    child: Container(
      height: size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF2D2D2D),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            key,
            style: const TextStyle(color: Colors.white),
          ),
          10.h,
          Row(
            children: [
              Icon(
                icons,
                size: 28,
                color: Colors.white,
              ),
              10.w,
              Text(
                values,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
