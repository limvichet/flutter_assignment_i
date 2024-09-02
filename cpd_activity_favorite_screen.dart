import 'package:assignment_flutter/cpd_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cpd_activity_favorite_logic.dart';



class FavoriteCpdActivityScreen extends StatefulWidget {
  const FavoriteCpdActivityScreen({super.key});

  @override
  State<FavoriteCpdActivityScreen> createState() => _FavoriteCpdActivityScreenState();
}

class _FavoriteCpdActivityScreenState extends State<FavoriteCpdActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Cpd Activity"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    List<Course> items =
        context.watch<FavoriteCpdActivityLogic>().favoriteCpdActivities;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(Course item) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (diss){
        if(diss == DismissDirection.endToStart){
          context.read<FavoriteCpdActivityLogic>().remove(item);
        }
      },
       child: Card(
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 100,
            child: Image.network(
                "https://w7.pngwing.com/pngs/1016/462/png-transparent-royal-university-of-phnom-penh-ministry-of-education-youth-and-sport-school-sport-university-higher-education.png"),
          ),
          onTap: () {
            // openUrl("mailto:${item.email}");
            // openUrl("tel:${item.cell}");
            // openUrl("https://www.google.com/search?q=:${item.location.state}+${item.location.country}");
            //openUrl("https://www.google.com/maps/place/Cambodia/@${item.location.coordinates.latitude},${item.location.coordinates.longitude},15z");
          },
          title: Text("${item.cpdCourseKh}"),
          subtitle: Text(
            "រៀបចំដោយ ${item.providerKh} ${item.startDate}",
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
    
        ),
      ),
    );
  }
}
