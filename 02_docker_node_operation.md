**Docker 환경 구성 및 서비스 운영 관련 기술로그**

```markdown
# Docker 기반 노드 운영 환경 구성 로그

## 데이터 경로 바인딩 및 컨테이너 실행
```bash
sudo systemctl stop docker
sudo mount --bind /home/aztech/sinso /var/lib/docker
sudo systemctl start docker
docker pull <service_image_name>
docker run -d --name compute-node -v /home/aztech/sinso:/data <service_image_name>
docker exec -it compute-node /bin/bash
