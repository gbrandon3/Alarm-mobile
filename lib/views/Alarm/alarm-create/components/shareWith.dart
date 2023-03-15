import 'package:alarm_movil/bloc/create_alarm_bloc.dart';
import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareWith extends StatefulWidget {
  List<String> contactsSelected;
  ShareWith({required this.contactsSelected});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShareWithState();
  }
}

class ShareWithState extends State<ShareWith> {
  List<String> contacts = [];
  List<String> contactS = [];
  @override
  void initState() {
    setState(() {
      contactS = widget.contactsSelected;
      for (var i = 0; i < 30; i++) {
        contacts.add("Contact $i");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context2) {
                return StatefulBuilder(
                  builder: (BuildContext context2,
                      void Function(void Function()) setState) {
                    return Dialog(
                        backgroundColor: backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "Compartir con",
                                              textAlign: TextAlign.center,
                                              style: headerDialog(),
                                            )),
                                        Positioned(
                                          left: 0,
                                          child: GestureDetector(
                                            child: iconDialog(),
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ListView.builder(
                                    itemBuilder: (BuildContext context, index) {
                                      return Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Color(
                                                                0xff2F4858)),
                                                    child: Center(
                                                      child: Text(
                                                          contactsInitials(
                                                            contacts[index],
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      25)),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    contacts[index],
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff33658A),
                                                        fontSize: 15),
                                                  )
                                                ],
                                              ),
                                              Checkbox(
                                                  value: contactS.contains(
                                                      contacts[index]),
                                                  onChanged: (bool) {
                                                    if (contactS.contains(
                                                        contacts[index])) {
                                                      setState(() {
                                                        contactS.remove(
                                                            contacts[index]);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        contactS.add(
                                                            contacts[index]);
                                                      });
                                                    }
                                                    if (contactS.isNotEmpty &&
                                                        contactS.length > 1) {
                                                      orderContacts();
                                                    }
                                                  })
                                            ],
                                          ));
                                    },
                                    itemCount: contacts.length,
                                  ),
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    height: 71,
                                    child: Row(
                                      children: [
                                        Visibility(
                                            visible: contactS.length < 3,
                                            child: Expanded(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: List.generate(
                                                    contactS.length,
                                                    (item) =>
                                                        contactsAdded(item),
                                                  ),
                                                ))),
                                        if (contactS.length >= 3)
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                                child: Text(
                                              contactsString(),
                                              textAlign: TextAlign.justify,
                                            )),
                                          ),
                                      ],
                                    )),
                                SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              BlocProvider.of<CreateAlarmBloc>(
                                                      context)
                                                  .add(AddContacts(contactS));
                                              Navigator.of(context).pop();
                                            },
                                            style: botonStyle(),
                                            child: Text(
                                              "Compartir",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.027),
                                            ),
                                          )
                                        ]))
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }).then((value) {
            setState(() {
              List<String> contats = [];
              for (var contact in widget.contactsSelected) {
                contats.add(contact);
              }
              contactS = contats;
              ;
            });
          });
        },
        child: Container(
          height: 30,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25))
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Compartir con",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Icon(
                Icons.chevron_right,
                color: primaryColor,
                size: 30,
              )
            ],
          ),
        ));
  }

  void orderContacts() {
    setState(() {
      contactS.sort(
          (elem1, elem2) => elem1.toLowerCase().compareTo(elem2.toLowerCase()));
    });
  }

  String contactsString() {
    if (contactS.length > 2) {
      String compartido =
          "Compartido con: ${contactS[0]}, ${contactS[1]}, ${contactS[2]}";
      return contactS.length == 3
          ? compartido + " y una persona más"
          : compartido + " y ${contactS.length - 3} personas más";
    } else {
      return "Contactos";
    }
  }

  Container contactsAdded(index) {
    return Container(
        margin: EdgeInsets.only(left: 5, top: 5),
        child: Column(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff2F4858)),
              child: Center(
                child: Text(
                    contactsInitials(
                      contactS[index],
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Text(contactS[index])
          ],
        ));
  }

  String contactsInitials(String contact) {
    final initials = contact.split(' ');

    return "${initials[0].substring(0, 1)}${initials[1].substring(0, 1)}  ";
  }
}
