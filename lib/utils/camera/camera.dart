import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

// Função para capturar imagem da câmera
Future<String> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);

  if (photo != null) {
    final bytes = await File(photo.path).readAsBytes();
    return base64Encode(bytes);
  } else {
    return "";
  }
}
