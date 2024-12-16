import 'package:flutter/material.dart';

class UtilsColores {
  /// Convierte un color hexadecimal en formato `0xRRGGBB` a un formato con opacidad `0xAARRGGBB` al máximo.
  static Color getColorFromHex(String hexColor) {
    print(hexColor);
    try {
      if (hexColor.startsWith('0x') && hexColor.length == 10) {
        return Color(int.parse(hexColor.substring(2), radix: 16));
      } else if (hexColor.startsWith('0x') && hexColor.length == 8) {
        // Convierte a hexColor que es un string en formato 0xRRGGBB a un formato con opacidad 0xAARRGGBB al máximo
        return Color(int.parse('FF' + hexColor.substring(2), radix: 16));
      } else {
        throw FormatException(
            'El color debe estar en formato "0xAARRGGBB" o "0xRRGGBB" con 6 u 8 dígitos.');
      }
    } catch (e) {
      // Manejo de errores con un color por defecto
      debugPrint('Error al procesar el color: $e');
      return Color(int.parse("FFd7d7d7", radix: 16)); // Color por defecto
    }
  }
}
