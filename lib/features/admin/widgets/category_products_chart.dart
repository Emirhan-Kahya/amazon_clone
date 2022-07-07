import 'package:amazon_clone/features/admin/models/sales_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CategoryProductsChart extends StatelessWidget {
  final List<charts.Series<SalesModel, String>> seriesList;
  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,

    );
  }
}
