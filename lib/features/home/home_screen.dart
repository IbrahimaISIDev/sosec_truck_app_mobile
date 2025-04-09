import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/action_card.dart';
import 'widgets/task_item.dart';
import 'widgets/header.dart';
import 'providers/home_provider.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(
                userName: "Ibrahima",
                truckId: "AA 883 TQ",
                date: "Mercredi, 12 Mars 2025",
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cartes d'action
                    Row(
                      children: [
                        Expanded(
                          child: ActionCard(
                            title: "Scanner ticket",
                            icon: Icons.camera_alt,
                            backgroundColor: AppColors.primaryBlue,
                            onTap: () {
                              // Navigation vers l'écran de scan
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ActionCard(
                            title: "Kilométrage",
                            icon: Icons.speed,
                            backgroundColor: AppColors.primaryBlue,
                            onTap: () {
                              // Navigation vers l'écran de kilométrage
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ActionCard(
                            title: "Dépenses",
                            icon: Icons.account_balance_wallet,
                            backgroundColor: AppColors.lightGrey,
                            onTap: () {
                              // Navigation vers l'écran des dépenses
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ActionCard(
                            title: "Alertes",
                            icon: Icons.warning,
                            backgroundColor: AppColors.secondaryOrange,
                            onTap: () {
                              // Navigation vers l'écran des alertes
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Tâches
                    const Text(
                      "Tâches d’aujourd’hui",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Consumer<HomeProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: provider.tasks.asMap().entries.map((entry) {
                            final index = entry.key;
                            final task = entry.value;
                            return TaskItem(
                              task: task,
                              onTap: () {
                                provider.toggleTaskCompletion(index);
                              },
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    // Bouton de synchronisation
                    Consumer<HomeProvider>(
                      builder: (context, provider, child) {
                        return ElevatedButton.icon(
                          onPressed: provider.toggleSync,
                          icon: const Icon(Icons.sync),
                          label: Text(
                            provider.isSynced ? "Synchronisé" : "Synchroniser",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.black,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
          onTap: (index) {
            // Logique de navigation
          },
        ),
      ),
    );
  }
}