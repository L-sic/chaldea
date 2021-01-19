import 'dart:math' show max, min;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'constants.dart';

class SHeader extends StatelessWidget {
  final String label;
  final TextStyle style;

  SHeader(this.label, {this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 4.0),
      child: Text(label,
          style: style ?? TextStyle(color: Colors.black54, fontSize: 14.0)),
    );
  }
}

class SFooter extends StatelessWidget {
  final String label;

  const SFooter(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 7.5),
      child: Text(
        label,
        style: TextStyle(
            color: Color(0xFF777777), fontSize: 13.0, letterSpacing: -0.08),
      ),
    );
  }
}

class SWidget extends StatelessWidget {
  final String label;
  final Icon icon;
  final Widget trailing;
  final VoidCallback callback;

  const SWidget({Key key, this.label, this.icon, this.trailing, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.setting_tile,
      child: ListTile(
        leading: icon,
        title: Text(label),
        trailing: trailing,
        onTap: callback,
      ),
    );
  }
}

class SModal extends StatelessWidget {
  final String label;
  final Icon icon;
  final String value;
  final VoidCallback callback;

  SModal({Key key, this.label, this.icon, this.value, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.setting_tile,
      child: ListTile(
        leading: icon,
        title: Text(label),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              value ?? "",
              style: TextStyle(color: Colors.grey),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 5.0,
              onPressed: null,
            ),
          ],
        ),
        onTap: callback,
      ),
    );
  }
}

class SSwitch extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool value;
  final ValueChanged<bool> callback;

  const SSwitch({Key key, this.label, this.icon, this.value, this.callback})
      : super(key: key); //handle switch/tile value change

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.setting_tile,
      child: SwitchListTile(
        secondary: icon,
        title: Text(label),
        value: value ?? false,
        onChanged: callback,
      ),
    );
  }
}

class SSelect extends StatelessWidget {
  final List<String> labels;
  final int selected;
  final ValueChanged<int> callback;

  const SSelect({Key key, this.labels, this.selected, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TileGroup(
      children: labels
          .asMap()
          .map((index, label) {
            return MapEntry(
                index,
                ListTile(
                  title: Text(label),
                  trailing: index == selected
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).primaryColor,
                        )
                      : null,
                  onTap: () {
                    callback(index);
                  },
                ));
          })
          .values
          .toList(),
    );
  }
}

/// [children] should be [SSwitch] or [SModal] or []
class TileGroup extends StatelessWidget {
  final List<Widget> children;
  final String header;
  final String footer;
  final EdgeInsets padding;

  const TileGroup(
      {Key key, this.children, this.header, this.footer, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> group = List.generate(
      children.length,
      (index) => Container(
        decoration: BoxDecoration(
          border: Border(
              top: Divider.createBorderSide(context, width: 0.5),
              bottom: index == children.length - 1
                  ? Divider.createBorderSide(context, width: 0.5)
                  : BorderSide.none),
        ),
        child: children[index],
      ),
    );
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (header != null) SHeader(header),
            ...group,
            if (footer != null) SFooter(footer)
          ]),
    );
  }
}

//not finished
class SRadios extends StatefulWidget {
  final List<Widget> tiles;

  const SRadios({Key key, this.tiles}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SRadiosState();
}

class _SRadiosState extends State<SRadios> {
  @override
  Widget build(BuildContext context) {
    return TileGroup(
      children: widget.tiles,
    );
  }
}

class RangeSelector<T extends num> extends StatefulWidget {
  final T start;
  final T end;
  final List<MapEntry<T, Widget>> startItems;
  final List<MapEntry<T, Widget>> endItems;
  final bool startEnabled;
  final bool endEnabled;
  final void Function(T, T) onChanged;

  final bool increasing;

  RangeSelector(
      {Key key,
      this.start,
      this.end,
      this.startItems,
      this.endItems,
      this.startEnabled = true,
      this.endEnabled = true,
      this.increasing = true,
      this.onChanged})
      : super(key: key);

  @override
  _RangeSelectorState createState() => _RangeSelectorState<T>();
}

class _RangeSelectorState<T extends num> extends State<RangeSelector<T>> {
  _RangeSelectorState();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DropdownButton<T>(
          value: widget.start,
          items: widget.startItems
              .map((entry) => DropdownMenuItem<T>(
                    value: entry.key,
                    child: entry.value,
                  ))
              .toList(),
          onChanged: widget.startEnabled
              ? (value) {
                  final start = value;
                  final end = widget.increasing == null
                      ? widget.end
                      : widget.increasing
                          ? max(start, widget.end)
                          : min(start, widget.end);
                  widget.onChanged(start, end);
                }
              : null,
        ),
        Text('   →   '),
        DropdownButton<T>(
          value: widget.end,
          items: widget.endItems
              .map((entry) => DropdownMenuItem<T>(
                    value: entry.key,
                    child: entry.value,
                  ))
              .toList(),
          onChanged: widget.endEnabled
              ? (value) {
                  final end = value;
                  final start = widget.increasing == null
                      ? widget.start
                      : widget.increasing
                          ? min(widget.start, end)
                          : max(widget.start, end);
                  widget.onChanged(start, end);
                }
              : null,
        )
      ],
    );
  }
}

List<Widget> divideTiles(Iterable<Widget> tiles,
    {Widget divider = const Divider(height: 1.0),
    bool top = false,
    bool bottom = false}) {
  Iterator iterator = tiles.iterator;
  if (!iterator.moveNext()) {
    return [];
  }
  List<Widget> combined = [];
  if (top) {
    combined.add(divider);
  }
  combined.add(iterator.current);
  while (iterator.moveNext()) {
    combined..add(divider)..add(iterator.current);
  }
  if (bottom) {
    combined.add(divider);
  }
  return combined;
}
