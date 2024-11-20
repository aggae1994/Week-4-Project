import 'package:flutter/material.dart';
import 'stationlistpage.dart';
import 'seatpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departureStation = '선택'; // 출발역 초기값
  String arrivalStation = '선택'; // 도착역 초기값

  // 출발역/도착역 선택 페이지로 이동
  void navigateToStationListPage(bool isDeparture) async {
    final selectedStation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(
          title: isDeparture ? '출발역' : '도착역', // 선택한 화면 제목 설정
        ),
      ),
    );

    // 선택된 역 이름을 저장
    if (selectedStation != null) {
      setState(() {
        if (isDeparture) {
          departureStation = selectedStation; // 출발역 설정
        } else {
          arrivalStation = selectedStation; // 도착역 설정
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'), // 앱바 제목
        centerTitle: true, // 가운데 정렬
      ),
      body: Container(
        color: Colors.grey[200], // 배경 색상
        padding: EdgeInsets.all(20), // 여백
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 세로축 가운데 정렬
          children: [
            // 출발역 및 도착역 선택 박스
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () =>
                        navigateToStationListPage(true), // 출발역 선택 화면으로 이동
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '출발역',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          departureStation,
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[400], // 구분선
                  ),
                  GestureDetector(
                    onTap: () =>
                        navigateToStationListPage(false), // 도착역 선택 화면으로 이동
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '도착역',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          arrivalStation,
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // 출발역/도착역 선택 박스와 버튼 간 간격
            // 좌석 선택 버튼
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: departureStation != '선택' && arrivalStation != '선택'
                    ? () {
                        // 조건 충족 시 SeatPage로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeatPage(
                              startStation: departureStation, // 선택된 출발역 전달
                              endStation: arrivalStation, // 선택된 도착역 전달
                            ),
                          ),
                        );
                      }
                    : null, // 조건 미충족 시 비활성화
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // 버튼 활성화 색상
                  disabledBackgroundColor: Colors.purple, // 버튼 비활성화 색상
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 모서리 둥글게
                  ),
                ),
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white, // 텍스트 색상
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
