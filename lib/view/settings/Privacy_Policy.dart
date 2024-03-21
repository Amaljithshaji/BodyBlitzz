import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Privacy Policy',style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(''' 
            
            
Thank you for using BodyBlitz, the workout planner app. This Privacy Policy outlines how we handle your information within the app.
            
1. Information Collection:
BodyBlitz does not collect any personal information from users. No registration with an email address is required to access the app's features.
            
2. Local Storage:
All data generated and managed within the app, including workout routines, fitness goals, and preferences, is stored locally on your device.
            
3. Device Information:
BodyBlitz may access basic device information for app performance and user experience enhancement. This information is not stored or transmitted.
            
4. Communication:
The app does not send promotional emails or announcements. Communication is limited to app-related functionalities.
            
5. Security:
Your data stored locally on the device is protected by standard security measures. We do not have access to, or control over, your local data.
            
6. User Choices:
You have full control over your app data. Uninstalling the app will remove all locally stored information from your device.
            
7. Updates to the Privacy Policy:
Any updates to this Privacy Policy will be reflected in the app without requiring user registration or consent.

8. Contact Us:
For any questions or concerns about this Privacy Policy or the app's data practices, please contact us at Amaljithshaji401@gmail.com.

Thank you for choosing BodyBlitz for your workout needs!
Luminar Techno Lab
Contact Email: Amaljithshaji401@gmail.com
      
                      ''',
                        style: GoogleFonts.roboto(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}