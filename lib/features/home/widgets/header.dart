import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';


class HomeHeader extends StatelessWidget {
  final String userName;
  final String truckId;
  final String date;

  const HomeHeader({
    required this.userName,
    required this.truckId,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SOSEC",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Bonjour, $userName",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Camion: $truckId",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: AppColors.white,
              child: const Text(
                "ID",
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}