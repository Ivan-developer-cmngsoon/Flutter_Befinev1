import 'package:flutter/material.dart';
import 'package:befine_app/models/product_model.dart';
import 'package:befine_app/services/hive_product_service.dart';
import 'product_form_dialog.dart'; // ✅ Importa el formulario visual

class DuenoProductScreen extends StatefulWidget {
  const DuenoProductScreen({super.key});

  @override
  State<DuenoProductScreen> createState() => _DuenoProductScreenState();
}

class _DuenoProductScreenState extends State<DuenoProductScreen> {
  late List<Product> _productos;

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  void _cargarProductos() {
    setState(() {
      _productos = HiveProductService.getAllProducts();
    });
  }

  void _eliminarProducto(Product producto) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('¿Eliminar producto?'),
        content: Text('¿Deseas eliminar "${producto.name}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Eliminar')),
        ],
      ),
    );

    if (confirmar == true) {
      await HiveProductService.deleteProduct(producto.id);
      _cargarProductos();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${producto.name} fue eliminado')),
      );
    }
  }

  void _mostrarFormulario({Product? producto}) {
    showDialog(
      context: context,
      builder: (_) => ProductFormDialog(
        producto: producto,
        onSave: (Product nuevoProducto) async {
          final yaExiste = HiveProductService.getProductById(nuevoProducto.id) != null;

          if (yaExiste) {
            await HiveProductService.updateProduct(nuevoProducto);
          } else {
            final ok = await HiveProductService.addProduct(nuevoProducto);
            if (!ok) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ya existe un producto con ese ID')),
              );
              return;
            }
          }

          _cargarProductos();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Productos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarFormulario(), // ✅ Crear producto
        child: const Icon(Icons.add),
      ),
      body: _productos.isEmpty
          ? const Center(child: Text('No hay productos registrados'))
          : ListView.builder(
              itemCount: _productos.length,
              itemBuilder: (context, index) {
                final producto = _productos[index];
                return ListTile(
                  title: Text(producto.name),
                  subtitle: Text('${producto.type} • \$${producto.price.toStringAsFixed(0)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _mostrarFormulario(producto: producto), // ✅ Editar producto
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _eliminarProducto(producto),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
