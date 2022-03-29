import 'package:flutter/material.dart';

import 'package:weaver_core/models/asset_file.dart';
import 'package:weaver_core/models/form/all.dart';

typedef IntWidgetFunction = Widget Function(int index);
typedef MapDataCellListFunction = List<DataCell> Function(Map<String, dynamic>);
typedef MapVoidFunction = void Function(Map<String, dynamic>);
typedef MapBoolFunction = bool Function(Map<String, dynamic>);

typedef FormAssetHandler = void Function(FormFieldModel, FormGroupModel,
    [AssetFile?]);
