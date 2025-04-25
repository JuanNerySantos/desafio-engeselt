import 'package:image_picker/image_picker.dart';

// Função para capturar imagem da câmera
Future<List<XFile>?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
  final List<XFile> listPicker = [];

  if (pickedFile != null) {
    listPicker.add(pickedFile);
    return listPicker;
  } else {
    return null;
  }
}
