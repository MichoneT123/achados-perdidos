import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatisticCard(
              title: "Itens Registrados",
              count: 1500, // Substituir pelos dados reais
              color: Colors.blue,
            ),
            StatisticCard(
              title: "Itens no Mês",
              count: 120, // Substituir pelos dados reais
              color: Colors.green,
            ),
            StatisticCard(
              title: "Itens na Semana",
              count: 30, // Substituir pelos dados reais
              color: Colors.red,
            ),
          ],
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(""),
          ),
        ),
      ],
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  StatisticCard({
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              count.toString(),
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemData {
  final String month;
  final int count;

  ItemData({required this.month, required this.count});
}
