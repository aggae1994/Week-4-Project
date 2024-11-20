import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String startStation; // 출발역
  final String endStation; // 도착역

  SeatPage({required this.startStation, required this.endStation});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<List<bool>> seats =
      List.generate(20, (index) => List.generate(4, (i) => false)); // 20행 4열 좌석
  int? selectedRow; // 선택된 행
  int? selectedColumn; // 선택된 열

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 출발역과 도착역 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.startStation,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_circle_right_outlined,
                    size: 30, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  widget.endStation,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // 좌석 리스트
            Expanded(
              child: ListView.builder(
                itemCount: seats.length,
                itemBuilder: (context, rowIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${rowIndex + 1}', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 10),
                      ...List.generate(4, (colIndex) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // 모든 좌석 초기화
                              for (var i = 0; i < seats.length; i++) {
                                for (var j = 0; j < seats[i].length; j++) {
                                  seats[i][j] = false;
                                }
                              }
                              // 선택한 좌석만 활성화
                              seats[rowIndex][colIndex] = true;
                              selectedRow = rowIndex;
                              selectedColumn = colIndex;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            decoration: BoxDecoration(
                              color: seats[rowIndex][colIndex]
                                  ? Colors.purple
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // 예매 버튼
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: (selectedRow != null && selectedColumn != null)
                  ? () {
                      // 예매 확인 Dialog 출력
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('예매 하시겠습니까?'),
                            content: Text(
                                '좌석: ${selectedRow! + 1}-${String.fromCharCode(65 + selectedColumn!)}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Dialog 닫기
                                },
                                child: Text('취소'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Dialog 닫기
                                  Navigator.pop(context); // HomePage로 이동
                                },
                                child: Text('확인'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  : null, // 좌석 선택되지 않으면 비활성화
              child: Text(
                '예매 하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
