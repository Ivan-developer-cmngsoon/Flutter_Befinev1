import 'package:flutter/material.dart';
import 'package:befine_app/models/product_model.dart';
import 'package:uuid/uuid.dart';

class ProductFormDialog extends StatefulWidget {
  final Product? producto;
  final void Function(Product) onSave;

  const ProductFormDialog({
    super.key,
    this.producto,
    required this.onSave,
  });

  @override
  State<ProductFormDialog> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late String _id;
  late String _name;
  late String _description;
  late double _price;
  late String _imageUrl;
  late String _type;
  late int _stock;

  final List<String> _tipos = ['agua', 'dispensador', 'accesorio'];

  @override
  void initState() {
    super.initState();
    final p = widget.producto;
    _id = p?.id ?? const Uuid().v4();
    _name = p?.name ?? '';
    _description = p?.description ?? '';
    _price = p?.price ?? 0;
    _imageUrl = p?.imageUrl ?? '';
    _type = p?.type ?? _tipos[0];
    _stock = p?.stock ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final esEdicion = widget.producto != null;

    return AlertDialog(
      title: Text(esEdicion ? 'Editar Producto' : 'Nuevo Producto'),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  onSaved: (val) => _name = val!.trim(),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Campo requerido' : null,
                ),
                TextFormField(
                  initialValue: _description,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                  onSaved: (val) => _description = val!.trim(),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Campo requerido' : null,
                ),
                TextFormField(
                  initialValue: _price == 0 ? '' : _price.toString(),
                  decoration: const InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _price = double.tryParse(val!) ?? 0,
                  validator: (val) =>
                      val == null || double.tryParse(val) == null ? 'Número válido' : null,
                ),
                TextFormField(
                  initialValue: _stock == 0 ? '' : _stock.toString(),
                  decoration: const InputDecoration(labelText: 'Stock'),
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _stock = int.tryParse(val!) ?? 0,
                  validator: (val) =>
                      val == null || int.tryParse(val) == null ? 'Número válido' : null,
                ),
                TextFormField(
                  initialValue: _imageUrl,
                  decoration: const InputDecoration(labelText: 'URL Imagen'),
                  onSaved: (val) => _imageUrl = val!.trim(),
                ),
                DropdownButtonFormField<String>(
                  value: _type,
                  items: _tipos
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (val) => setState(() => _type = val!),
                  decoration: const InputDecoration(labelText: 'Tipo de producto'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final producto = Product(
                id: _id,
                name: _name,
                description: _description,
                price: _price,
                imageUrl: _imageUrl,
                type: _type,
                stock: _stock,
              );
              widget.onSave(producto);
              Navigator.pop(context);
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
