import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'ucp_button.dart';

class UcpButtons {
  UcpButtons._();

  static add(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.add') : null,
      iconData: Icons.add,
      onPressed: onPressed);

  static delete(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.delete') : null,
      iconData: Icons.delete,
      onPressed: onPressed);

  static edit(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.edit') : null,
      iconData: Icons.edit,
      onPressed: onPressed);

  static view(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.view') : null,
      iconData: Icons.view_module,
      onPressed: onPressed);

  static query(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.query') : null,
      iconData: Icons.search,
      onPressed: onPressed);

  static reset(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.reset') : null,
      iconData: Icons.refresh,
      onPressed: onPressed);

  static resetPassword(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.password') : null,
      iconData: Icons.lock,
      onPressed: onPressed);

  static save(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.save') : null,
      iconData: Icons.save,
      onPressed: onPressed);

  static cancel(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.cancel') : null,
      iconData: Icons.cancel,
      onPressed: onPressed);

  static commit(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.commit') : null,
      iconData: Icons.done,
      onPressed: onPressed);

  static submit(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.submit') : null,
      iconData: Icons.approval_outlined,
      onPressed: onPressed);
  static review(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.review') : null,
      iconData: Icons.fact_check_outlined,
      onPressed: onPressed);
  static approve(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.approve') : null,
      iconData: Icons.check_circle_outline,
      onPressed: onPressed);
  static correct(context, onPressed, {showLabel: true}) => UcpButton(
      label: showLabel ? translate('buttons.correct') : null,
      iconData: Icons.edit,
      onPressed: onPressed);
}
