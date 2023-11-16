import 'package:flutter/material.dart';

class UserHistoryPage extends StatefulWidget {
  const UserHistoryPage({super.key});

  @override
  State<UserHistoryPage> createState() => _UserHistoryPageState();
}

class _UserHistoryPageState extends State<UserHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de viajes'),
      ),
      body: ListView(
        children: [
          _cardHistoryInfo(),
          _cardHistoryInfo(),
          _cardHistoryInfo(),
          _cardHistoryInfo(),
          _cardHistoryInfo(),
          _cardHistoryInfo()
        ],
      ),
    );
  }

  Widget _cardHistoryInfo() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.location_on),
              SizedBox(width: 5),
              Text(
                'Lugar de Origen: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Dirección de prueba',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.location_searching),
              SizedBox(width: 5),
              Text(
                'Destino: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Dirección de prueba',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.money),
              SizedBox(width: 5),
              Text(
                'Precio: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  '0\$',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.star),
              SizedBox(width: 5),
              Text(
                'Calificación: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  '5.0',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 5),
              Icon(Icons.timer),
              SizedBox(width: 5),
              Text(
                'Fecha: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Fecha de prueba',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
