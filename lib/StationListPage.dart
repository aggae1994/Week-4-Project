import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title; //리스트 정의,정의한 문자열 타입의 리스트 이름이 변경되면 안되기 때문에 파이널 사용
  final List<String> stations = [
    ///문자열  리스트안에 있는 값 목록
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산",
  ]; //리스트 끝

  StationListPage({required this.title});

  /// 역 선택 리스트 앱바에 표시될 텍스트 제목을 불러옴

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // 위에서 받아온 텍스트를 앱바에 표시
        centerTitle: true,

        /// 텍스트 가운데 정렬
      ),
      body: ListView.builder(
        //역목록의 각 항목을 순차적으로 생성하여 스크롤 가능한 리스트로 표시
        itemCount: stations.length,

        ///표시될 리스트 의 값을 정의함,리스트의 값에 갯수 만큼
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  stations[index], //리스트 안에 있는 문자열 타입의 역 이름을 출력
                  style: TextStyle(
                    /// 역 이름 속성
                    fontSize: 18, //크기
                    fontWeight: FontWeight.bold, //글자 굵기
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                      context, stations[index]); //선택된 역 이름을 이전 화면으로 반환
                },
              ),
              Divider(
                //// 선택할수있는 역 리스트 하단에 표시될 회색 선
                height: 1, // 간격
                thickness: 1, // 두께
                color: Colors.grey[300]!, // 색상
              ),
            ],
          );
        },
      ),
    );
  }
}
