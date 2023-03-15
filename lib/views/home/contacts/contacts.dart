import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.1, vertical: height * 0.025),
        child: Column(children: [
          Container(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0.0, 4),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.25))
                  ]),
              child: TextField(
                decoration: inputDecorationSearch("Buscar"),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, index2) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff2F4858)),
                                      child: Center(
                                        child: Text(
                                            contactsInitials(
                                              "Contact ${index2}",
                                            ),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Contact ${index2}",
                                      style: const TextStyle(
                                          color: Color(0xff33658A),
                                          fontSize: 15),
                                    )
                                  ])
                            ]));
                  }))
        ]));
  }

  String contactsInitials(String contact) {
    final initials = contact.split(' ');

    return "${initials[0].substring(0, 1)}${initials[1].substring(0, 1)}  ";
  }
}
