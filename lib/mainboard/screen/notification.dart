import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "แจ้งเตือน",
        style: TextStyle(fontFamily: 'Opun'),
      )),
      body: Card(
        child: (Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text(
                'แจ้งเตือน',
                style: TextStyle(fontFamily: 'Opun'),
              ),
              subtitle: Text(
                'หัวใจเต้นผิดปกติ! ผู้ป่วยสามารถ ค้นหา โรงพยาบาลไกล้เคียงได้ทันที',
                style: TextStyle(
                  fontFamily: 'Opun',
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
