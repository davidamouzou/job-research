import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/utils/routes/routes_name.dart';

class NavigationPage extends StatefulWidget {
  final Widget child;
  const NavigationPage({super.key, required this.child});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(Iconsax.home, "Home",
                      () => _showContent(AppRoutesName.home.name)),
                  _buildNavItem(Iconsax.search_normal_1, "Search",
                      () => _showContent(AppRoutesName.search.name)),
                  const SizedBox(width: 28), // Spacer for FloatingActionButton
                  _buildNavItem(Iconsax.category, "My Tasks",
                      () => _showContent(AppRoutesName.task.name)),
                  _buildNavItem(Iconsax.user, "Profile",
                      () => _showContent(AppRoutesName.profile.name)),
                ],
              ),
            ),
            Positioned(
              top: -23,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 8,
                      ),
                    ),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showContent(String content) {
    context.pushNamed(content);
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        height: 49,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}