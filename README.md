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


우분투 도커 설치 
```
sudo apt update
sudo apt upgrade -y
sudo apt install ca-certificates curl gnupg -y
```

```
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
```
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER
```
```
docker --version
```
