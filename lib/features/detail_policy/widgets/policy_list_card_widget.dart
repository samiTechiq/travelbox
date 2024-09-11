import 'package:flutter/material.dart';
class PolicyCard extends StatelessWidget {
  final List<Widget>policyList;
  const PolicyCard({Key? key,required this.policyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: policyList,
    );
  }
}
