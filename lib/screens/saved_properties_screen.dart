import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:housingapp/models/user_preferences.dart';
import 'package:housingapp/models/property.dart';
import 'package:housingapp/services/mock_property_service.dart';
import 'package:housingapp/widgets/listing_card.dart';
import 'package:housingapp/screens/property_detail_screen.dart';

class SavedPropertiesScreen extends StatelessWidget {
  const SavedPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserPreferences>(context);
    final propertyService = Provider.of<MockPropertyService>(context);

    final List<Property> allProperties = propertyService.getProperties();
    final List<String> savedIds = userPreferences.savedPropertyIds;

    final filteredSavedProperties = allProperties
        .where((property) => savedIds.contains(property.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Properties'),
      ),
      body: filteredSavedProperties.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No saved properties yet.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Save properties from the listings to view them here!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: filteredSavedProperties.length,
              itemBuilder: (context, index) {
                final property = filteredSavedProperties[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListingCard(
                    property: property,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PropertyDetailScreen(property: property)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}