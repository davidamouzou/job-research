import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/ui/widgets/profile_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Freelancers"),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(35, 36, 39, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Iconsax.location,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text("London")
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search input
            Row(
              children: [
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "UX/UI Designer",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 0.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Icon(
                    Iconsax.setting,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // List profile
            ...profileData.map((profile) {
              return ProfileCard(profile: profile);
            }),
          ],
        ),
      ),
    );
  }
}
