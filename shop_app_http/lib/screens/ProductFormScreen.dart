import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/Product.dart';
import 'package:shop_app/providers/ProductsProvider.dart';

class ProductFormScreen extends StatefulWidget {
  static const routePath = 'product-form';

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _titleFocusNode = FocusNode();
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
  bool _isInit = true;
  bool _isLoading = false;
  Map<String, String> _initValues = {
    'title': '',
    'description': '',
    'imageUrl': '',
    'price': ''
  };

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
    _titleFocusNode.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final bool isValid = _form.currentState.validate();
    if (isValid) {
      _form.currentState.save();
      ProductsProvider provider =
          Provider.of<ProductsProvider>(context, listen: false);

      setState(() {
        _isLoading = true;
      });
      print(product.id);

      if (product.id != null) {
        provider.updateProduct(this.product.id, this.product);
      } else {
        provider.addProduct(product).then((void _) {
          setState(() {
            _isLoading = false;
          });
          Navigator.of(context).pop();
        }).catchError((error) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('An error ocurred'),
                content: Text('Something went wrong!'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok!'),
                    onPressed: () {
                      this._titleFocusNode.unfocus();
                      this._descriptionFocusNode.unfocus();
                      this._priceFocusNode.unfocus();
                      this._imageUrlFocusNode.unfocus();
                      this._imageUrlController.text = '';

                      setState(() {
                        this._isLoading = false;
                      });
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        });
      }
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      String productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        ProductsProvider provider =
            Provider.of<ProductsProvider>(context, listen: false);

        Product product = provider.findById(productId);
        this.product = product;
        this._initValues = {
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price.toString()
        };

        this._imageUrlController.text = this._initValues['imageUrl'];
      }
    }
    this._isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
        child: this._isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      focusNode: _titleFocusNode,
                      initialValue: this._initValues['title'],
                      validator: (String value) {
                        return value.length > 4
                            ? null
                            : 'The title must have a least 5 characters!';
                      },
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (String _) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      onSaved: (String value) {
                        this.product = Product(
                          isFavorite: this.product.isFavorite,
                          id: this.product.id,
                          title: value,
                          price: this.product.price,
                          description: this.product.description,
                          imageUrl: this.product.imageUrl,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: this._initValues['price'],
                      validator: (String value) {
                        return value.length != 0 && double.tryParse(value) > 0
                            ? null
                            : 'You must enter a valid number!';
                      },
                      decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (String _) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      onSaved: (String value) {
                        this.product = Product(
                          isFavorite: this.product.isFavorite,
                          id: this.product.id,
                          title: this.product.title,
                          price: double.parse(value),
                          description: this.product.description,
                          imageUrl: this.product.imageUrl,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: this._initValues['description'],
                      validator: (String value) {
                        return value.length > 5
                            ? null
                            : 'You must add at least 5 characters of description!';
                      },
                      decoration: InputDecoration(labelText: 'Description'),
                      focusNode: _descriptionFocusNode,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      onSaved: (String value) {
                        this.product = Product(
                          isFavorite: this.product.isFavorite,
                          id: this.product.id,
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
                            validator: (String value) {
                              return value.isNotEmpty &&
                                      value.startsWith('http')
                                  ? null
                                  : 'You must enter a valid url!';
                            },
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
                                isFavorite: this.product.isFavorite,
                                id: this.product.id,
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
