<h1 align="center">
# [Flutter 기초] 개인 과제 - 기차 예매 서비스
<aside>

</aside>

## **homepage**

<aside>
import 'package:flutter/material.dart';
  <br>
  <br>
import 'stationlistpage.dart';
  <br>
  <br>
import 'seatpage.dart';
  <br>
<br>
class HomePage extends StatefulWidget {
  <br>
  <br>
  @override
  <br>
  <br>
  _HomePageState createState() => _HomePageState();
  <br>
  <br>
}
<br>
class _HomePageState extends State<HomePage> {
  <br>
  <br>
  String departureStation = '선택';
<br>
  <br>
  ///출발역  초기 값
  String arrivalStation = '선택'; ////도착역 초기값
<br>
  <br>
  void navigateToStationListPage(bool isDeparture) async {
  <br>
  <br>
    final selectedStation = await Navigator.push(
  <br>
  <br>
      context,
  <br>
  <br>
      MaterialPageRoute(
  <br>
  <br>
        builder: (context) => StationListPage(
          // 선택한 박스가 출발역인지 도착역인지에 따라 리스트 앱바에 다른 제목이 출력됩니다.
  <br>
  <br>
//빌더는 다른 화면 생성에 사용되고,콘텍스트로 인수를 받아 역 선택 페이지에 반환한다.
  <br>
  <br>
          title: isDeparture
              ? '출발역'
              : '도착역', // 조건을 비교하여 참이면 출발역 리스트로 화면을 전환하고, 거짓이면 도착역 리스트 화면으로 전환 합니다.
  <br>
  <br>
        ),
      ),
    );
    if (selectedStation != null) {
  <br>
  <br>
      setState(() {
  <br>
  <br>
        if (isDeparture) {
  <br>
  <br>
          departureStation = selectedStation; // 선택된 출발역 저장
  <br>
  <br>
        } else {
  <br>
  <br>
          arrivalStation = selectedStation; // 선택된 도착역 저장
  <br>
  <br>


  @override
  <br>
  Widget build(BuildContext context) {
  <br>
  <br>
    return Scaffold(
    <br>
    <br>
      appBar: AppBar(
      <br>
      <br>
        title: Text('기차 예매'), // 앱바 에 적힌 텍스트 , 가운데 정렬
        <br>
        <br>
        centerTitle: true,
        <br>
        <br>
      ),
      body: Container(
      <br>
      <br>
        color: Colors.grey[200], // 초기 화면 배경 색깔
        <br>
        <br>
        padding: EdgeInsets.all(20), // 여백 설정
        <br>
        <br>
        child: Column(
        <br>
        <br>
          mainAxisAlignment: MainAxisAlignment.center, //컨테이너 세로축 가운데정렬
          <br>
          <br>
          children: [
          <br>
          <br>
            Container(
            <br>
            <br>
              // 출발역과 도착역 선택 박스
              <br>
              <br>
              height: 200, //박스 높이
              <br>
              <br>
              decoration: BoxDecoration(
              <br>
              <br>
                color: Colors.white, //박스 색깔
                <br>
                <br>
                borderRadius: BorderRadius.circular(20), // 모서리 둥글게
                <br>
                <br>
              ),
              child: Row(
              <br>
              <br>
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 가로축 균등 배치
                <br>
                <br>
                children: [
                <br>
                <br>
                  GestureDetector(
                  <br>
                  <br>
                    onTap: () =>
                    <br>
                    <br>
                        navigateToStationListPage(true), // 출발역 선택 페이지로 이동
                        <br>
                        <br>
                    child: Column(
                    <br>
                    <br>
                      mainAxisAlignment: MainAxisAlignment.center, // 세로축 중앙 정렬
                      <br>
                      <br>
                      children: [
                      <br>
                      <br>
                        Text(
                        <br>
                        <br>
                          '출발역', // 컨테이너 안에 출발역
                          <br>
                          <br>
                          style: TextStyle(
                          <br>
                          <br>
                            fontSize: 16,
                            <br>
                            <br>
                            color: Colors.grey,
                            <br>
                            <br>
                            fontWeight: FontWeight.bold,
                            <br>
                            <br>
                          ),
                        ),
                        SizedBox(height: 10),
                        <br>
                        <br>

                        /// 위에 있는 컨테이너 텍스트랑 내가 리스트에서 선택한 텍스트 사이의 간격
                        Text(
                        <br>
                        <br>
                          departureStation,
                          <br>
                          <br>
                          style:
                          <br>
                          <br>
                              TextStyle(fontSize: 40), // 리스트 안에 있는 선택된 출발역 텍스트
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[400],
                  ), // 선택한 출발역 과 선택역 사이 구분선
                  GestureDetector(
                    // 리스트 에서 도착역 선택
                    onTap: () =>
                        navigateToStationListPage(false), // 클릭시 도착역 선택 페이지로 이동
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // 도착역 가운데정렬
                      children: [
                        Text(
                          '도착역',
                          style: TextStyle(
                            // 도착역 텍스트 및 텍스트 속성
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10), // 간격 추가
                        Text(
                          arrivalStation,
                          style: TextStyle(fontSize: 40), // 선택된 도착역 텍스트 속성
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20, // 좌석 선택 버튼과 출발,도착역 버튼 사이 간격
            ),
            SizedBox(
              height: 50, //버튼 높이 속성
              width: double.infinity, // 엘리베이터 버튼의 최대 넓이
              child: ElevatedButton(
                // 좌석 선택 버튼
                onPressed: departureStation != '선택' &&
                        arrivalStation != '선택' // 출발역,도착역이 모두 선택됬을때만 사용 가능하게 함
                    ? () {
                        // 조건이 만족하면 좌석 선택 화면으로 넘어감
                      }
                    : null, // 조건 이 만족하지 않으면 널값
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, //조건 만족시 버튼색
                  disabledBackgroundColor: Colors.purple, //조건 불만족시 버튼색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 버튼 모서리 속성
                  ),
                ),
                child: Text(
                  '좌석 선택', // 엘리베이터 버튼 안에 들어가는 텍스트
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255), //글자색
                    fontSize: 18,
                    fontWeight: FontWeight.bold, //글자 굵기 속성
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
</aside>


## **StationListPage**
<aside>
  import 'package:flutter/material.dart';
<br>
  <br>
class StationListPage extends StatelessWidget {
  <br>
  <br>
  final String title; //리스트 정의,정의한 문자열 타입의 리스트 이름이 변경되면 안되기 때문에 파이널 사용
  <br>
  <br>
  final List<String> stations = [
    <br>
    <br>
    ///문자열  리스트안에 있는 값 목록
    <br>
    <br>
    "수서",
    <br>
    "동탄",
    <br>
    "평택지제",
    <br>
    "천안아산",
    <br>
    "오송",
    <br>
    "대전",
    <br>
    "김천구미",
    <br>
    "동대구",
    <br>
    "경주",
    <br>
    "울산",
    <br>
    "부산",
    <br>
  ]; //리스트 끝
<br>
    <br>
  StationListPage({required this.title});
<br>
      <br>
  /// 역 선택 리스트 앱바에 표시될 텍스트 제목을 불러옴
<br>
      <br>
  @override
    <br>
      <br>
  Widget build(BuildContext context) {
    <br>
      <br>
    return Scaffold(
    <br>
      <br>
      appBar: AppBar(
    <br>
      <br>
        title: Text(title), // 위에서 받아온 텍스트를 앱바에 표시
    <br>
      <br>
        centerTitle: true,
      <br>
<br>
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

</aside>


