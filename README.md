환경변수 설정

backend/.env 
```
DB_HOST=
DB_USER=
DB_PASS=
DB_NAME=
PORT=
```
db/.env
```
ACCEPT_EULA=
SA_PASSWORD=
MSSQL_PID=
```

실행 

```
docker compose up -d
```

삭제 
```
docker compose down
```

실행중인 컨테이너 확인 
```
docker ps -a
```


ssms 접속 
```
#서버이름
127.0.0.1,1433
#인증
SQL server 인증
#사용자 이름
sa
#서버 인증서 신뢰 체크
```
