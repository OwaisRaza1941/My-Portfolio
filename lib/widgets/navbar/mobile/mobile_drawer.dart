import 'package:flutter/material.dart';
import 'package:portfolio/models/nav_item.dart';
import 'package:portfolio/utils/app_color.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/buttons/primary_button.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
    required this.onNavItemTap,
    required this.onHireMe,
  });

  final ValueChanged<NavItem> onNavItemTap;
  final VoidCallback onHireMe;

  static const List<NavItem> _items = [
    NavItem(label: AppStrings.navHome, anchor: 'home'),
    NavItem(label: AppStrings.navAbout, anchor: 'about'),
    NavItem(label: AppStrings.navServices, anchor: 'services'),
    NavItem(label: AppStrings.navSkills, anchor: 'skills'),
    NavItem(label: AppStrings.navProjects, anchor: 'projects'),
    NavItem(label: AppStrings.navContact, anchor: 'contact'),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Owais.",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];

                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item.label,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        onNavItemTap(item);
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: AppStrings.hireMe,
                  onPressed: () {
                    Navigator.pop(context);
                    onHireMe();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
