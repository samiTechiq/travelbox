import 'package:flutter/material.dart';

typedef ExpansionBuilder = Widget Function(BuildContext, bool);

class ExpansionBox extends StatefulWidget {
  final bool isExpanded;
  final EdgeInsetsGeometry? contentPadding;
  final Decoration? decoration;
  final ExpansionBuilder? headerBuilder;
  final ExpansionBuilder? bodyBuilder;

  const ExpansionBox({
    super.key,
    this.isExpanded = false,
    this.decoration,
    this.contentPadding,
    this.headerBuilder,
    this.bodyBuilder,
  });

  @override
  State<ExpansionBox> createState() => _ExpansionBoxState();
}

class _ExpansionBoxState extends State<ExpansionBox>
    with TickerProviderStateMixin {
  late final AnimationController _sizeTransactionController;
  late final Animation<double> _sizeAnimation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _sizeTransactionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 400),
    );
    _sizeAnimation = CurvedAnimation(
      parent: _sizeTransactionController,
      curve: Curves.fastOutSlowIn,
    );

    if (widget.isExpanded) {
      isExpanded = widget.isExpanded;
      _sizeTransactionController.forward();
    }
  }

  @override
  void dispose() {
    _sizeTransactionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: widget.decoration ?? BoxDecoration(),
      child: InkWell(
        onTap: () {
          setState(() {
            if(isExpanded){
              _sizeTransactionController.reverse();
            }
            else{
              _sizeTransactionController.forward();
            }
            isExpanded = !isExpanded;
          });
        },
        child: Padding(
          padding: widget.contentPadding ?? EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.headerBuilder?.call(context, isExpanded) ??
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Title',
                      ),
                      ),
                      Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down)
                    ],
                  ),
              SizeTransition(
                sizeFactor: _sizeAnimation,
                child: widget.bodyBuilder?.call(context, isExpanded) ??
                    SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
