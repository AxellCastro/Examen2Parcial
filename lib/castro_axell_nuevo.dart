import 'package:flutter/material.dart';

class CastroAxellNuevo extends StatefulWidget {
  const CastroAxellNuevo({super.key});

  @override
  State<CastroAxellNuevo> createState() => _CastroAxellNuevoState();
}

class _CastroAxellNuevoState extends State<CastroAxellNuevo> {
  final _formKey = GlobalKey<FormState>();
  final _cedulaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _correoController = TextEditingController();

  DateTime? _fechaReserva;
  String? _personasSeleccionadas;
  String? _disponiblesSeleccionados;
  bool _efectivo = false;
  bool _tarjeta = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Reserva',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFE97132),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _cedulaController,
                      decoration: const InputDecoration(
                        labelText: 'Cédula',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su cédula';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.person, size: 48),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _apellidosController,
                      decoration: const InputDecoration(
                        labelText: 'Apellidos',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese sus apellidos';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (selectedDate != null &&
                            selectedDate != _fechaReserva) {
                          setState(() {
                            _fechaReserva = selectedDate;
                          });
                        }
                      },
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Fecha de Reserva',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        child: Text(_fechaReserva != null
                            ? '${_fechaReserva!.toLocal()}'.split(' ')[0]
                            : 'Seleccionar fecha'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _personasSeleccionadas,
                      decoration: const InputDecoration(
                        labelText: 'Número de Personas',
                        border: OutlineInputBorder(),
                      ),
                      items:
                          <String>['1', '2', '3', '4', '5'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _personasSeleccionadas = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor seleccione el número de personas';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _telefonoController,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su teléfono';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _disponiblesSeleccionados,
                      decoration: const InputDecoration(
                        labelText: 'Disponibles',
                        border: OutlineInputBorder(),
                      ),
                      items: <String>['Opción 1', 'Opción 2', 'Opción 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _disponiblesSeleccionados = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor seleccione una opción disponible';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _correoController,
                      decoration: const InputDecoration(
                        labelText: 'Correo Electrónico',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su correo electrónico';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: _efectivo,
                          onChanged: (bool? value) {
                            setState(() {
                              _efectivo = value ?? false;
                            });
                          },
                        ),
                        const Text('Efectivo'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                          value: _tarjeta,
                          onChanged: (bool? value) {
                            setState(() {
                              _tarjeta = value ?? false;
                            });
                          },
                        ),
                        const Text('Tarjeta'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final datos = {
                          'Cédula': _cedulaController.text,
                          'Nombre': _nombreController.text,
                          'Apellidos': _apellidosController.text,
                          'Fecha de Reserva': _fechaReserva.toString(),
                          'Número de Personas': _personasSeleccionadas,
                          'Disponibles': _disponiblesSeleccionados,
                          'Teléfono': _telefonoController.text,
                          'Correo Electrónico': _correoController.text,
                          'Forma de Pago': {
                            'Efectivo': _efectivo,
                            'Tarjeta': _tarjeta,
                          },
                        };
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirmación'),
                              content: const Text('Guardado Correctamente'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        print(datos);
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      setState(() {
                        _cedulaController.clear();
                        _nombreController.clear();
                        _apellidosController.clear();
                        _telefonoController.clear();
                        _correoController.clear();
                        _fechaReserva = null;
                        _personasSeleccionadas = null;
                        _disponiblesSeleccionados = null;
                        _efectivo = false;
                        _tarjeta = false;
                      });
                    },
                    child: const Text('Borrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
