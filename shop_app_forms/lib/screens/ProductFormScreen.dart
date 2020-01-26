import 'package:flutter/material.dart';
import 'package:shop_app/providers/Product.dart';

class ProductFormScreen extends StatefulWidget {
  static const routePath = 'product-form';

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  Product product = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

  @override
  void initState() {
    _imageUrlController.addListener(onChangedFocus);
    super.initState();
  }

  void onChangedFocus() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    _form.currentState.save();
    print(product.price);
    print(product.title);
    print(product.description);
    print(product.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    print(_imageUrlController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Form'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              this._saveForm();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (String _) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (String value) {
                  this.product = Product(
                    id: null,
                    title: value,
                    price: this.product.price,
                    description: this.product.description,
                    imageUrl: this.product.imageUrl,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (String _) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (String value) {
                  this.product = Product(
                    id: null,
                    title: this.product.title,
                    price: double.parse(value),
                    description: this.product.description,
                    imageUrl: this.product.imageUrl,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                focusNode: _descriptionFocusNode,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                onSaved: (String value) {
                  this.product = Product(
                    id: null,
                    title: this.product.title,
                    price: this.product.price,
                    description: value,
                    imageUrl: this.product.imageUrl,
                  );
                },
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Center(
                            child: Text('Enter a URL'),
                          )
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image Url'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (String _) {
                        this._saveForm();
                      },
                      onSaved: (String value) {
                        this.product = Product(
                          id: null,
                          title: this.product.title,
                          price: this.product.price,
                          description: this.product.description,
                          imageUrl: value,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
