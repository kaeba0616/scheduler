# event calendar

## inital setup

- environment

  - android api level : 33 (tiramisu)
  - phone : Pixel XL

- .env 파일에 각 api 키를 발급받아 작성해주세요

## File structure

```
- lib
    - constants
        - constants.dart : 지역이름과 코드 정보

    - models
        - event.dart : API로 부터 받은 공연 정보를 담는 모델
        - eventDetail.dart : API로 부터 받은 공연 상세정보를 담는 모델
        - facility.dart : API로 부터 받은 공연장소 정보를 담는 모델

    - screens
        - calendar.dart : library를 이용한 달력 화면
        - eventDetail.dart : 공연 상세정보 화면
        - eventScreen.dart : 공연 종류와 이름을 보여주는 화면
        - mapScreen.dart : 공연 장소를 지도에 표시해주는 화면

    - services
        - api_service.dart : kopis api를 이용해 공연 정보를 받아오는 서비스
        - naver_api.dart : naver map api를 이용해 공연장소를 지도에 표시해주는 서비스

    - widgets
        - calendar_eventButton.dart : 달력 밑에 해당 날짜의 eventScreen을 보여주는 버튼

        - detail_widget.dart : eventDetail 화면에 띄울 위젯들
        - event_widget.dart : eventScreen에 각 공연의 poster와 title을 보여주는 위젯
        - map_widget.dart : 공연장소를 기반으로 naver map을 보여주는 widget

    - main.dart
        - 시작 화면을 보여주는 main
```
