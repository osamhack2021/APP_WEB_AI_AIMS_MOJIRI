# mojiri WEB(Backend & Frontend) readme.md

# MOJIRI WEB GUIDE

해당 프로젝트에서 WEB의 역할은 

APP및 AI와의 연계를 위한 API 제공 및 관리자 페이지 제공을 담당하고 있다

본 프로젝트는 *Node.js*를 기반으로 제작되었으며, Express-generator를 기반으로 한 MVC 모델로 이루어져 있다.



## 구성 및 사용법

### 구성

현재 WEB 부문 구성은 아래와 같다

- *bin*
    - 기본 서버 설정 및 실행 파일이 위치한다.
- *config*
    - 연결된 DB 설정 파일이 위치한다.
- *controllers*
    - 사용자가 요구한 기능에 대한 실제 연산을 담당하는 파일들이 위치한다.
- *models*
    - DB 테이블 모델 파일들이 위치한다.
- *routes*
    - 사용자가 접근할 수 있는 endpoint 설정 파일들이 위치한다. controllers와의 연계도 담당한다.
- *seeders*
    - 개발 중 테스트 데이터 셋을 위한 파일들이 위치한다.
- *temp*
    - AI 관련 연산 처리 중 임시로 저장되는 이미지 파일들이 위치한다.
- *views*
    - 관리자 페이지 UI를 위한 HTML&CSS&EJS 파일들이 위치한다.
- *app.js*
    - 원활한 서버 실행을 위한 각종 middleware 및 설정들을 위한 파일이 위치한다.
- *package.json* & *package-lock.json
    - 원활한 서버 실행을 위한 모듈 파일들을 기록한 파일이다.

### 사용법 (+테스트)
1. Github Clone
```bash
$ git clone http://github.com/osamhack2021/APP_WEB_AI_AIMS_MOJIRI
```
2. Module 파일 다운로드
```bash
$ cd WEB
$ npm install
```
3. 서버 실행
```bash
$ sudo npm start
```
4. 관리자 페이지 URL <br>
Link : [Admin Page](http://20.194.62.71)

### 추가정보

본 WEB 설정 파일들은 VM 상에서 원활한 실행이 가능하도록 구성되어 있다.

기존 작업환경이 아닌 다른 작업환경에서의 경우 프로그램 실행 과정에서 오류가 발생할 수 있다.

## 기존 작업환경 정보
VM ID : osam22@20.194.62.71 <br>

VM PW : ahwlfl1234 <br>

VM IP : 20.194.62.71 <br>


## 관리자 페이지 ID
ID : 14-12345678 <br>
PW : 1234
