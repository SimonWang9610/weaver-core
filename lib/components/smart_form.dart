import 'dart:typed_data'; // Uint8List
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart'; // kIsWeb

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:xid/xid.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:weaver_core/widgets/weaver_all.dart';
import '../utils/dict_util.dart';
import '../models/form/form_model.dart';
import '../models/form/form_group_model.dart';
import '../models/form/form_field_model.dart';
import '../models/asset_file.dart';
import 'package:weaver_core/base/vo/select_option_vo.dart';
import 'package:weaver_core/common/common_types.dart';
import '../utils/utils.dart';

class SmartForm extends StatefulWidget {
  final FormModel model;
  final Map<String, dynamic> store;
  final GlobalKey<FormState> formKey;
  final FormAssetHandler? onAddAsset;
  final FormAssetHandler? onDeleteAsset;
  final String Function(String, String)? getAssetStreamUrl;

  SmartForm({
    Key? key,
    required this.model,
    required this.store,
    required this.formKey,
    this.onAddAsset,
    this.onDeleteAsset,
    this.getAssetStreamUrl,
  }) : super(key: key);

  @override
  _SmartFormState createState() => _SmartFormState();
}

class _SmartFormState extends State<SmartForm> {
  late Widget child;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    if (widget.model.groups.length == 1) {
      child = _buildFields(context, widget.model.groups[0].fields);
    } else {
      child = _buildPanels(context, widget.model.groups);
    }

    if (widget.model.description == null) {
      return SingleChildScrollView(
        child: Container(
          child: Form(
            key: widget.formKey,
            child: child,
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                translate(widget.model.description!),
                style: GoogleFonts.lato(fontSize: 18.0),
              ),
            ),
            Container(
                child: Form(
              key: widget.formKey,
              child: child,
            )),
          ],
        ),
      );
    }
  }

  Widget _buildFields(BuildContext context, List<FormFieldModel> fields) {
    return Wrap(
      children: fields.map<Widget>((FormFieldModel field) {
        return _buildField(
            context, field, widget.store, widget.model.groups[0]);
      }).toList(),
    );
  }

  Widget _buildPanels(BuildContext context, List<FormGroupModel> groups) {
    return Container(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            groups[index].isExpanded = !isExpanded;
          });
        },
        children: groups.map<ExpansionPanel>((FormGroupModel group) {
          return _buildPanel(context, group);
        }).toList(),
      ),
    );
  }

  // Create a panel for a group
  ExpansionPanel _buildPanel(BuildContext context, FormGroupModel group) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          child: ListTile(
            title: Text(
              translate(group.label),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.menu),
            selectedTileColor: Colors.blue.shade100,
          ),
        );
      },
      body: Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10.0,
          runSpacing: 5.0,
          alignment: WrapAlignment.start,
          children: _buildPanelBody(context, group),
        ),
      ),
      isExpanded: group.isExpanded,
      canTapOnHeader: true,
    );
  }

  Widget _buildField(BuildContext context, FormFieldModel field,
      Map<String, dynamic> store, FormGroupModel? group) {
    final Widget smartWidget;

    if (widget.model.isViewMode) {
      smartWidget = UcpInput(
        label: translate(field.label),
        value: field.value?.toString(),
        obscureText: field.obscure!,
        enable: false,
      );
      return smartWidget;
    }

    if (field.hidden != null && field.hidden == true) {
      // This field is invisible.
      store[field.id] = field.value;
      return SizedBox();
    }

    if (field.type == 'select') {
      // select field
      if (field.value == '') {
        // DropdownButtonFormField cannot accept empty value
        field.value = null;
      }
      smartWidget = UcpSelect(
        label: translate(field.label),
        value: field.value,
        onChange: (v) {
          field.value = v;
        },
        dataList: DictUtil.getOptionList(field.dcode!),
        onSaved: (v) {
          store[field.id] = v;
        },
        validator: (v) {
          if (field.mandatory!) {
            if (v == null || (v.isEmpty && !group!.isExpanded)) {
              setState(() {
                group!.isExpanded = true;
              });
            }
            return v!.isEmpty ? 'This field is required' : null;
          } else {
            return null;
          }
        },
      );
    } else if (field.type == 'multi_select') {
      // multi_select field
      List<SelectOptionVO> _initialValue = [];
      // must use List<SelectOptionVO?> in order to run in debug mode.
      // List<SelectOptionVO> is fine in release mode.
      List<SelectOptionVO?> _items = DictUtil.getOptionList(field.dcode!);

      if (field.value != null) {
        List<String> keys = field.value.split(',');
        Map<String, String> map = Map<String, String>();
        for (var key in keys) {
          map[key] = key;
        }
        for (var it in _items) {
          if (map[it!.value] != null) {
            _initialValue.add(it);
          }
        }
      }

      /*smartWidget = Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MultiSelectDialogField(
          title: Text(translate(field.label)),
          initialValue: _initialValue,
          items: _items.map((e) => MultiSelectItem(e, e!.label!)).toList(),
          selectedColor: Colors.blue,
          decoration: BoxDecoration(
            //color: Colors.blue.withOpacity(0.1),
            //borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
          buttonText: Text(
            translate(field.label),
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
            ),
          ),
          onConfirm: (values) {
            List<String> keys = [];
            for (var v in values) {
              SelectOptionVO it = v as SelectOptionVO;
              keys.add(it.value as String);
            }
            store[field.id] = keys.join(',');
          },
        ),
      );*/

      smartWidget = Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MultiSelectChipField(
          title: Text(translate(field.label)),
          headerColor: Colors.white,
          initialValue: _initialValue,
          items: _items.map((e) => MultiSelectItem(e, e!.label!)).toList(),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          selectedChipColor: Colors.grey,
          selectedTextStyle: TextStyle(color: Colors.white),
          onTap: (values) {
            List<String> keys = [];
            for (var v in values) {
              SelectOptionVO it = v as SelectOptionVO;
              keys.add(it.value as String);
            }
            store[field.id] = keys.join(',');
          },
        ),
      );
    } else if (field.type == 'date') {
      // date field
      smartWidget = UcpSelectDate(
        context,
        label: translate(field.label),
        value: field.value,
        onChange: (v) {
          field.value = v;
        },
        onSaved: (v) {
          store[field.id] = v;
        },
        validator: (v) {
          if (field.mandatory!) {
            if (v!.isEmpty && !group!.isExpanded) {
              setState(() {
                group.isExpanded = true;
              });
            }
            return v.isEmpty ? 'This field is required' : null;
          } else {
            return null;
          }
        },
      );
    } else if (field.type == 'number') {
      // number field
      smartWidget = UcpInputNum(
        label: translate(field.label),
        value: field.value,
        enable: !(field.readonly ?? false),
        onChange: (v) {
          field.value = v;
        },
        onSaved: (v) {
          store[field.id] = v;
        },
        validator: (v) {
          if (field.mandatory!) {
            if (v!.isEmpty && !group!.isExpanded) {
              setState(() {
                group.isExpanded = true;
              });
            }
            return v.isEmpty ? 'This field is required' : null;
          } else {
            return null;
          }
        },
      );
    } else {
      // string field
      smartWidget = UcpInput(
        label: translate(field.label),
        value: field.value,
        obscureText: field.obscure!,
        enable: !(field.readonly ?? false),
        onChange: (v) {
          field.value = v;
        },
        onSaved: (v) {
          store[field.id] = v;
        },
        validator: (v) {
          if (field.mandatory!) {
            if (v!.isEmpty && !group!.isExpanded) {
              setState(() {
                group.isExpanded = true;
              });
            }
            return v.isEmpty ? 'This field is required' : null;
          } else {
            return null;
          }
        },
      );
    }

    return smartWidget;
  }

  _startWebFilePicker(FormGroupModel group) async {
    var uploadInput = html.FileUploadInputElement();

    uploadInput.accept = '.png,.jpg,.jpeg,.gif,.pdf,.txt';
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // Read file content as dataURL
      final files = uploadInput.files;

      if (files!.length == 1) {
        final file = files[0];
        final reader = html.FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            if (file.size > 1000 * 1000 * 10) {
              // TODO display alert
            } else {
              List<int> bytesData = reader.result as List<int>;
              String assetId = Xid().toString();
              String fieldType = 'image';

              if (file.type.endsWith('pdf')) {
                fieldType = 'pdf';
              } else if (file.type.endsWith('plain')) {
                fieldType = 'text';
              }

              AssetFile assetFile = AssetFile(
                  id: assetId,
                  name: file.name,
                  path: group.layout,
                  type: file.type,
                  size: file.size,
                  bytes: bytesData);
              FormFieldModel newField = FormFieldModel(
                  id: assetId,
                  label: group.layout,
                  type: fieldType,
                  value: assetFile);

              addAsset(assetFile, newField, group);
            }
          });
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  List<Widget> _buildPanelBody(BuildContext context, FormGroupModel group) {
    if (group.layout == 'grid') {
      return <Widget>[];
    } else if (group.layout == 'documents' || group.layout == 'reports') {
      // The flow panel places each asset entity in a "flow" layout.
      // An asset can be an image, a PDF file, a video, etc.
      List<Widget> assets = group.fields.map<Widget>((FormFieldModel field) {
        return _buildAsset(field, group);
      }).toList();

      if (!widget.model.isViewMode) {
        assets.add(
          IconButton(
            iconSize: 96.0,
            icon: Icon(
              Icons.add,
              color: Colors.grey,
            ),
            onPressed: () {
              if (kIsWeb) {
                _startWebFilePicker(group);
              }
            },
          ),
        );
      }
      /*assets.add(
        IconButton(
          iconSize: 96.0,
          icon: Icon(
            Icons.attach_file,
            color: Colors.pink,
          ),
          onPressed: () {
            if (kIsWeb) {
              _startWebFilePicker(group);
            }
          },
        ),
      );*/
      return assets;
    } else {
      return group.fields.map<Widget>((FormFieldModel field) {
        return _buildField(context, field, widget.store, group);
      }).toList();
    }
  }

  Widget _buildAsset(FormFieldModel field, FormGroupModel group) {
    // FlatButton class is deprecated, please use TextButton instead.
    // https://stackoverflow.com/questions/59076399/what-is-the-difference-between-an-image-and-imageprovider-in-flutter/65773283#65773283
    if (field.type == 'image') {
      // Create an Image widget
      var imageWidget;

      if (field.value.runtimeType == AssetFile) {
        final assetFile = field.value as AssetFile;
        imageWidget = Image.memory(assetFile.bytes as Uint8List);
      } else {
        imageWidget = Image.network(field.value);
      }

      return Container(
        height: 96,
        width: 96,
        child: TextButton(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageWidget.image,
              ),
            ),
          ),
          onPressed: () async {
            // showAsset(field, group);
          },
          onLongPress: () {
            if (!widget.model.isViewMode) {
              deleteAsset(field, group);
            }
          },
        ),
      );
    } else {
      final path = 'assets/images/' + field.type + '.png';
      return Container(
        height: 96,
        width: 96,
        child: TextButton(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(path),
              ),
            ),
          ),
          onPressed: () async {
            // showAsset(field, group);
          },
          onLongPress: () {
            deleteAsset(field, group);
          },
        ),
      );
    }
  }

  addAsset(AssetFile file, FormFieldModel field, FormGroupModel group) {
    if (widget.onAddAsset != null) {
      widget.onAddAsset!(field, group, file);
    }

    group.fields.add(field);
  }

  deleteAsset(FormFieldModel field, FormGroupModel group) {
    if (field.value.runtimeType == AssetFile) {
      if (widget.onDeleteAsset != null) {
        final file = field.value as AssetFile;
        widget.onDeleteAsset!(field, group, file);
      }

      // Delete the newly added asset from UI.
      setState(() {
        group.fields.removeWhere((item) => item.id == field.id);
      });
    } else {
      if (widget.onDeleteAsset != null) {
        // Invoke the callback to delete the asset.
        widget.onDeleteAsset!(field, group);
      }

      // Delete the asset from UI.
      setState(() {
        group.fields.removeWhere((item) => item.id == field.id);
      });
    }
  }

  // showAsset(FormFieldModel field, FormGroupModel group) {
  //   if (field.type == 'image1') {
  //     _showImageDialog(field.value); // field.value is url for this image
  //   } else {
  //     // Perform platformViewRegistry in order to render a web page in an iframe.
  //     // https://docs.flutter.dev/release/breaking-changes/platform-views-using-html-slots-web
  //     if (widget.getAssetStreamUrl != null) {
  //       final _url = widget.getAssetStreamUrl!(field.id, group.layout);
  //       final viewType = field.id;

  //       // CSS center an iirame horizontally and vertically in its container
  //       // https://www.joellipman.com/articles/web-development/css/css-center-an-iframe-horizontally-and-vertically.html
  //       ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
  //         final html.Element htmlElement = html.IFrameElement()
  //           ..src = _url
  //           ..style.border = '1px solid grey'
  //           ..style.position = 'fixed'
  //           ..style.top = '50%'
  //           ..style.left = '50%'
  //           ..style.transform = 'translate(-50%,-50%)'
  //           ..style.alignItems = 'center'
  //           ..style.width = '100%'
  //           ..style.height = '100%';
  //         return htmlElement;
  //       });

  //       NavigatorUtil.push(context, Viewer(viewType: viewType));
  //     }
  //   }
  // }

  Future<void> _showImageDialog(String imageUrl) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: SizedBox.expand(
            child: Container(
              child: CachedNetworkImage(
                placeholder: (context, url) => Container(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black38),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(70.0),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Material(
                  child: Text('Image is not avialble'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
                imageUrl: imageUrl,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                translate('button.close'),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
