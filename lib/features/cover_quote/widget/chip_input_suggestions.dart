import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';

typedef ChipsInputSuggestions<T> = Future<List<T>> Function(String query);
typedef ChipSelected<T> = void Function(T data, bool selected);
typedef ChipsBuilder<T> = Widget Function(
    BuildContext context, ChipsInputState<T> state, T data, bool isFirst);

class ChipsInput<T> extends StatefulWidget {
  const ChipsInput({
    Key? key,
    this.decoration = const InputDecoration(),
    required this.chipBuilder,
    required this.suggestionBuilder,
    required this.findSuggestions,
    required this.onChanged,
    this.onChipTapped,
    this.isWeb = false,
    this.height,
  }) : super(key: key);

  final InputDecoration decoration;
  final ChipsInputSuggestions findSuggestions;
  final ValueChanged<List<T>> onChanged;
  final ValueChanged<T>? onChipTapped;
  final ChipsBuilder<T> chipBuilder;
  final ChipsBuilder<T> suggestionBuilder;
  final bool isWeb;
  final double? height;

  @override
  ChipsInputState<T> createState() => ChipsInputState<T>();
}

class ChipsInputState<T> extends State<ChipsInput<T>>
    implements TextInputClient {
  static const kObjectReplacementChar = 0xFFFC;

  Set<T> _chips = <T>{};
  List<T>? _suggestions;
  int _searchId = 0;

  late FocusNode _focusNode;
  TextEditingValue _value = const TextEditingValue();
  TextInputConnection? _connection;

  String get text => String.fromCharCodes(
        _value.text.codeUnits.where((ch) => ch != kObjectReplacementChar),
      );

  bool get _hasInputConnection => _connection != null && _connection!.attached;

  void requestKeyboard() {
    if (_focusNode.hasFocus) {
      _openInputConnection();
    } else {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  void selectSuggestion(T data) {
    setState(() {
      _chips.add(data);
      _updateTextInputState();
      _suggestions = null;
    });
    widget.onChanged(_chips.toList(growable: false));
  }

  void deleteChip(T data) {
    setState(() {
      _chips.remove(data);
      _updateTextInputState();
    });
    widget.onChanged(_chips.toList(growable: false));
  }

  void deleteAllChips() {
    setState(() {
      _chips.clear();
      _updateTextInputState();
    });
    widget.onChanged(_chips.toList(growable: false));
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _openInputConnection();
    } else {
      _closeInputConnectionIfNeeded();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _closeInputConnectionIfNeeded();
    super.dispose();
  }

  void _openInputConnection() {
    if (!_hasInputConnection) {
      _connection = TextInput.attach(this, const TextInputConfiguration());
      _connection?.setEditingState(_value);
    }
    _connection?.show();
  }

  void _closeInputConnectionIfNeeded() {
    if (_hasInputConnection) {
      _connection?.close();
      _connection = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var chipsChildren = _chips
        .map<Widget>(
          (data) => widget.chipBuilder(context, this, data, false),
        )
        .toList();

    chipsChildren.add(
      SizedBox(
        height: 35.0.h,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
            ),
            _TextCaret(
              resumed: _focusNode.hasFocus,
            ),
          ],
        ),
      ),
    );

    return Column(
      // clipBehavior: Clip.antiAlias,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: R.palette.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: requestKeyboard,
                  child: InputDecorator(
                    decoration: _buildInputDecoration(),
                    isFocused: _focusNode.hasFocus,
                    isEmpty: _value.text.isEmpty,
                    child: Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: chipsChildren,
                    ),
                  ),
                ),
              ),
              _chips.isNotEmpty
                  ? Padding(
                      padding:
                          EdgeInsets.only(right: widget.isWeb ? 8.w : 20.w),
                      child: InkWell(
                        onTap: () {
                          deleteAllChips();
                        },
                        child: Image.asset(
                          R.assets.graphics.cross.path,
                          scale: 5,
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
        _suggestions != null && _suggestions!.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: R.palette.white,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _suggestions?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return widget.suggestionBuilder(
                          context, this, _suggestions![index], index == 0);
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  void updateEditingValue(TextEditingValue value) {
    final oldCount = _countReplacements(_value);
    final newCount = _countReplacements(value);
    setState(() {
      if (newCount < oldCount) {
        _chips = Set.from(_chips.take(newCount));
      }
      _value = value;
    });
    _onSearchChanged(text);
  }

  int _countReplacements(TextEditingValue value) {
    return value.text.codeUnits
        .where((ch) => ch == kObjectReplacementChar)
        .length;
  }

  @override
  void performAction(TextInputAction action) {
    _focusNode.unfocus();
  }

  InputDecoration _buildInputDecoration() {
    // Adjust content padding based on whether chips are present
    // EdgeInsets contentPadding = _chips.isEmpty
    //     ? EdgeInsets.only(
    //         left: widget.isWeb ? 20 : 15,
    //         top: widget.isWeb ? 15 : 10,
    //         bottom: widget.isWeb ? 20 : 10)
    //     : EdgeInsets.only(
    //         left: widget.isWeb ? 20 : 15,
    //         top: 10,
    //         bottom: widget.isWeb ? 20 : 10);

    EdgeInsets contentPadding = _chips.isEmpty
        ? const EdgeInsets.only(
            left: 20,
            top: 10,
            bottom: 10,
          )
        : EdgeInsets.only(
            left: 20,
            top: widget.isWeb ? 10 : 10,
            bottom: widget.isWeb ? 15 : 10,
          );

    return widget.decoration.copyWith(
      contentPadding: contentPadding,
      // ... other decoration properties ...
    );
  }

  void _updateTextInputState() {
    final text =
        String.fromCharCodes(_chips.map((_) => kObjectReplacementChar));
    _value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      composing: TextRange(start: 0, end: text.length),
    );
    _connection?.setEditingState(_value);
  }

  void _onSearchChanged(String value) async {
    final localId = ++_searchId;
    final results = await widget.findSuggestions(value);
    if (_searchId == localId && mounted) {
      setState(() => _suggestions = results
          .where((profile) => !_chips.contains(profile))
          .cast<T>()
          .toList(growable: false));
    }
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _TextCaret extends StatefulWidget {
  const _TextCaret({
    Key? key,
    this.resumed = false,
  }) : super(key: key);

  final bool resumed;

  @override
  _TextCursorState createState() => _TextCursorState();
}

class _TextCursorState extends State<_TextCaret>
    with SingleTickerProviderStateMixin {
  bool _displayed = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), _onTimer);
  }

  void _onTimer(Timer timer) {
    setState(() => _displayed = !_displayed);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      child: Opacity(
        opacity: _displayed && widget.resumed ? 1.0 : 0.0,
        child: Container(
          width: 2.0,
          color: R.palette.appPrimaryBlue,
        ),
      ),
    );
  }
}
