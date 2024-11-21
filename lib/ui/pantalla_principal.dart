import 'package:flutter/material.dart';
import '../logica/capicua.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PantallaPrincipalState();
}

class PantallaPrincipalState extends State<PantallaPrincipal> {
  // Instanciar la lógica
  final Capicua _verificarCapicua = Capicua();

  // Variable para almacenar el número
  int _numero = 0;

  // Variable para mostrar el resultado final
  String _resultadoFinal = '';

  // Control de texto
  final TextEditingController _numeroController = TextEditingController();

  // Método para validar
  void _validarNumero() {
    String numeroTexto = _numeroController.text;

    if (numeroTexto.isEmpty) {
      setState(() {
        _resultadoFinal = 'Por favor, ingresa un número.';
      });
      return;
    }
    if (int.tryParse(numeroTexto) == null) {
      setState(() {
        _resultadoFinal = 'Por favor, ingresa un número válido.';
      });
      return;
    }

    // Convertir el texto a entero
    _numero = int.parse(numeroTexto);

    try {
      final bool esCapicua = _verificarCapicua.esCapicua(_numero);
      setState(() {
        _resultadoFinal = esCapicua
            ? 'El número es capicúa.'
            : 'El número no es capicúa.';
      });
    } catch (e) {
      setState(() {
        _resultadoFinal = 'El número debe ser de 5 dígitos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Capicúa'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            Text(
              'Ingresa un número de 5 dígitos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _validarNumero,
              child: Text('Verificar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),

            Text(
              _resultadoFinal,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
