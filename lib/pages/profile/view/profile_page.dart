import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: AppTypography.headingH2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 45),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 52),
                            Text(
                              "Tabe Lilian",
                              style: AppTypography.headingH2,
                            ),
                            const SizedBox(height: 4),
                            Wrap(
                              spacing: 8,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                Text(
                                  'UI/UX + Brand Designer',
                                  style:
                                      AppTypography.bodySmallRegular.copyWith(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: AppColors.textColor.withOpacity(0.5),
                                ),
                                Text(
                                  'lilian.tabe@vtc.cm',
                                  style:
                                  AppTypography.bodySmallRegular.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                             child: Text(
                               "Joined: 01 Mar 2024",
                               style: AppTypography.headingH2.copyWith(
                                 color: AppColors.white,
                               ),
                             ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 45,
                      child: Icon(
                        Icons.person,
                        size: 36,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.white,
                ),
                child: ListTile(
                  title: Text(
                    "Your Organization",
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textColor.withOpacity(0.5),
                    ),
                  ),
                  subtitle: Text(
                    "VTC",
                    style: AppTypography.headingH2,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.textColor,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.white,
                ),
                child: ListTile(
                  title: Text(
                    "Your Office Location",
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textColor.withOpacity(0.5),
                    ),
                  ),
                  subtitle: Text(
                    "Remote",
                    style: AppTypography.headingH2,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.textColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
