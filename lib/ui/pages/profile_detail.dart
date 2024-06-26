import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/data/profile_model.dart';

class ProfileView extends StatelessWidget {
  final Profile profile;
  const ProfileView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Iconsax.arrow_left),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profile.photoUrl),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profile.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(55, 86, 61, 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(profile.rating.toString()),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(profile.function),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Iconsax.instagram5),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Iconsax.link),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Iconsax.global),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Iconsax.lifebuoy),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(35, 36, 39, 1),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        buildWork(context, 'Full-time', 'Work'),
                        const SizedBox(width: 8),
                        buildWork(context, '2 years', 'Experience'),
                        const SizedBox(width: 8),
                        buildWork(
                            context, '\$${profile.priceHour}', 'Rate per hour'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(profile.bio),
                    const SizedBox(height: 16),
                    const Text(
                      'Portfolio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: profile.portfolio!.map((image) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                image,
                                width: 280,
                                height: 240,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FilledButton(
            onPressed: () {},
            child: const Text('Contact'),
          ),
        ),
      ),
    );
  }
}

// profile_view.dart
Widget buildWork(BuildContext context, String title, String description) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.4,
          color: Theme.of(context).textTheme.bodyLarge!.color!,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
          ],
        ),
      ),
    ),
  );
}
