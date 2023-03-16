import 'package:alarm_movil/views/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/create_alarm_bloc.dart';

class TypeSelector extends StatefulWidget {
  final String seccion;

  String value;
  TypeSelector({required this.seccion, required this.value});

  @override
  State<StatefulWidget> createState() {
    return TypeSelectorState();
  }
}

class TypeSelectorState extends State<TypeSelector> {
  final List<String> tipo = ["Evento", "Recordatorio"];
  String selected = "";
  @override
  void initState() {
    selected = widget.seccion;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
              context: context,
              backgroundColor: backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              builder: (BuildContext context2) {
                return StatefulBuilder(
                    builder: (context2, StateSetter setState) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    height: 300,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Elegir tipo",
                                  textAlign: TextAlign.center,
                                  style: headerBottomDialog(),
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: iconDialog(),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Column(
                          children: List.generate(
                              tipo.length,
                              (index) => typeItem(tipo[index], (valueS) {
                                    if (valueS != selected) {
                                      setState(() {
                                        selected = valueS!;
                                      });
                                      BlocProvider.of<CreateAlarmBloc>(context)
                                          .add(SetType(valueS!));
                                    }
                                    Navigator.of(context).pop();
                                  })),
                        )),
                      ],
                    ),
                  );
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
                widget.seccion,
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

  Expanded typeItem(String type, Function(String?) onChanged) {
    return Expanded(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: TextStyle(
              fontSize: 30,
              color: type == "Evento" ? eventColor : remiderColor),
        ),
        Radio<String>(value: type, groupValue: selected, onChanged: onChanged)
      ],
    ));
  }
}
