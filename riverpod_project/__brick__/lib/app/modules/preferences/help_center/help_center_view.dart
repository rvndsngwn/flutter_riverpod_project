import 'package:flutter/material.dart';
import 'package:utils_widget/utils_widget.dart';
import '../google_map/google_map_view.dart';
import '../preferences_view/copyrights.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "How can we help you?",
                      style: TextStyle(
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      "We will response rapidly.",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Feel free to contact us via your convenient way",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomContainer(
                    margin: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                    child: ListTile(
                      title: const Padding(
                        padding: EdgeInsets.only(bottom: 8, top: 8),
                        child: Text(
                          'Mohesu Enterprises\n#1268, Sector 3, Rohtak',
                          textScaleFactor: 1.2,
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          CustomContainer(
                            blurRadius: 3,
                            height: 250,
                            margin: const EdgeInsets.only(top: 5),
                            child: GoogleMapView(),
                          ),
                          const ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(
                              '\nMobile: +91 9416183949'
                              '\nEmail: contactus@mohesu.com',
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const CopyRights()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SocialLinks(),
        ],
      ),
    );
  }
}
