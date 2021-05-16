import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //alias
import 'package:flutter_basic_navigation/models/covid19_model.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  //การเรียกใช้ Model Covide19
  CovidModel _dataCovidApi;

  //สร้าง method ที่ใช้ทดสอบ โหลดข้อมูลจาก API
  //Future ทำ ให้รับค่า await ต่อไปได้
  Future<void> getData() async {
    var url = "https://covid19.th-stat.com/api/open/today";
    try {
      var response = await http.get(Uri.parse(url));
      print(response.body);
      setState(() {
        _dataCovidApi = covidModelFromJson(response.body); //set ไปยัง Model ของเรา
      });
      //setState ข้อมูล ใน _dataCovidApi
    } catch (e) {
      print(e);
    }
  }


  //เหมือน componentDidmount ใน React เมื่อ UI ถูกวาดมันจะถูกเรียก
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'ติดเชื้อสะสม',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          '${_dataCovidApi?.confirmed??"..."}',  //? คือเป็นค่า null หรือไม่ ถ้าไม่ แสดง อันซ้าย ถ้า null แสดงอันขวา
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'เสียชีวิต',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          '${_dataCovidApi?.deaths??"..."}',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'หายแล้ว',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Text(
                            '${_dataCovidApi?.recovered??"..."}',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'รักษาอยู่',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Text(
                            '${_dataCovidApi?.hospitalized??"..."}',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'รายใหม่',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          Text(
                            '${_dataCovidApi?.newConfirmed??"..."}',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          Center(child: Text("Chart Here !"))
        ],
      ),
    );
  }
}
