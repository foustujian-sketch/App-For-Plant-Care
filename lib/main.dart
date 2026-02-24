import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));

class Plant {
  String id, name, species, schedule;
  String? imagePath;
  Plant({required this.id, required this.name, required this.species, required this.schedule, this.imagePath});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Plant> plantList = [];

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus"),
          content: Text("Apakah Anda yakin ingin menghapus '${plantList[index].name}'?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("BATAL"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  plantList.removeAt(index);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Tanaman berhasil dihapus")),
                );
              },
              child: const Text("HAPUS", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _openForm([Plant? plant]) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage(plant: plant)));
    if (result != null && result is Plant) {
      setState(() {
        if (plant == null) {
          plantList.add(result);
        } else {
          int index = plantList.indexWhere((p) => p.id == plant.id);
          plantList[index] = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlantCare Pro"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: plantList.isEmpty
          ? const Center(child: Text("Belum ada koleksi tanaman."))
          : ListView.builder(
        itemCount: plantList.length,
        itemBuilder: (context, index) {
          final item = plantList[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: item.imagePath != null
                    ? Image.file(File(item.imagePath!), width: 50, height: 50, fit: BoxFit.cover)
                    : const Icon(Icons.image_not_supported),
              ),
              title: Text(item.name),
              subtitle: Text(item.species),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _confirmDelete(index),
              ),
              onTap: () => _openForm(item),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _openForm(), child: const Icon(Icons.add)),
    );
  }
}

class FormPage extends StatefulWidget {
  final Plant? plant;
  const FormPage({super.key, this.plant});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _nameCtrl = TextEditingController();
  final _speciesCtrl = TextEditingController();
  final _scheduleCtrl = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.plant != null) {
      _nameCtrl.text = widget.plant!.name;
      _speciesCtrl.text = widget.plant!.species;
      _scheduleCtrl.text = widget.plant!.schedule;
      if (widget.plant!.imagePath != null) _selectedImage = File(widget.plant!.imagePath!);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.plant == null ? "Tambah Tanaman" : "Edit Tanaman")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.camera),
                        title: const Text("Kamera"),
                        onTap: () {
                          _pickImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.image),
                        title: const Text("Galeri"),
                        onTap: () {
                          _pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200],
                child: _selectedImage != null
                    ? Image.file(_selectedImage!, fit: BoxFit.cover)
                    : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add_a_photo, size: 50), Text("Klik untuk ambil foto")],
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(controller: _nameCtrl, decoration: const InputDecoration(labelText: "Nama Tanaman", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: _speciesCtrl, decoration: const InputDecoration(labelText: "Spesies", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: _scheduleCtrl, decoration: const InputDecoration(labelText: "Jadwal Siram", border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                onPressed: () {
                  if (_nameCtrl.text.isNotEmpty) {
                    Navigator.pop(
                      context,
                      Plant(
                        id: widget.plant?.id ?? DateTime.now().toString(),
                        name: _nameCtrl.text,
                        species: _speciesCtrl.text,
                        schedule: _scheduleCtrl.text,
                        imagePath: _selectedImage?.path,
                      ),
                    );
                  }
                },
                child: const Text("Simpan"),
              ),
            )
          ],
        ),
      ),
    );
  }
}