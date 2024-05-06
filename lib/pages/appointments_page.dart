import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as dpt;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  String firstName = '';
  String lastName = '';
  DateTime selectedDate = DateTime.now();
  String selectedEmployee = 'Elizabeth';
  int appointmentCount = 0;

  void _selectDate(BuildContext context) {
    dpt.DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2025, 12, 31),
      onConfirm: (date) {
        if (date.isBefore(DateTime.now())) {
          Fluttertoast.showToast(
            msg: "No se pueden seleccionar fechas pasadas",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        } else {
          setState(() {
            selectedDate = date;
          });
        }
      },
    );
  }

  void _confirmReservation() {
    if (firstName.isEmpty || lastName.isEmpty) {
      Fluttertoast.showToast(
        msg: "Por favor, ingresa tu nombre y apellido",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    setState(() {
      appointmentCount++;
    });

    // Generar el código QR aquí (puedes utilizar la biblioteca qr_flutter)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservar Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre'),
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Apellido'),
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Fecha: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Seleccionar Fecha'),
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedEmployee,
              onChanged: (value) {
                setState(() {
                  selectedEmployee = value!;
                });
              },
              items: <String>['Elizabeth', 'Lourdes', 'Yvette']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Atendido por'),
            ),
            SizedBox(height: 20),
            Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: index < appointmentCount
                        ? Colors.green
                        : Colors.grey,
                    radius: 20,
                    child: Text((index + 1).toString()),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _confirmReservation();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Reserva Confirmada'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('¡Tu reserva ha sido confirmada!'),
                            QrImageView(
                              data:
                                  '$firstName $lastName\n${selectedDate.toString()}\nAtendido por: $selectedEmployee',
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Confirmar Reserva'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
