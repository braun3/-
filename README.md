
# 🧾 포트폴리오

보안관제·시스템 운영·자동화 구축 중심의 실무 경험을 기술적으로 정리한 포트폴리오입니다.  
리눅스 인프라 기반 환경에서 보안, 운영, 자동화 및 분산 연산 시스템을 구축·운용한 경험을 중심으로 기술했습니다.

---

## 🧠 경력 요약

- **경력 분야:** 보안관제, 정보보호시스템 운영, 인프라 관리, 자동화 구축  
- **핵심 역할:** 침해 이벤트 분석 및 대응 / 시스템 장애 복구 / 자동화 및 효율화  
- **강점 요약:**  
  • 공공기관 실무 경험 기반의 위협 분석 및 대응 능력  
  • 리눅스·네트워크 중심의 시스템 기술 역량  
  • Python을 활용한 보안운영 자동화 및 로그 정규화 능력  
  • 협업·커뮤니케이션 역량 (지방청, 부서 간 장애 대응 협업 경험)

---

## 🧩 기술 스택

| 분야 | 주요 기술 |
|------|------------|
| **OS / Infra** | Linux (Ubuntu), JBOD, RAID, iSCSI, LVM |
| **Network** | VLAN, LACP, MTU 9000, TCP/IP |
| **Security** | IDS/IPS, ESM, FW, DLP, 시그니처 룰 관리, 탐지 이벤트 분석 |
| **Automation / Scripting** | Python(로그 파싱, API 연동, 자동화 스크립트), Bash |
| **Distributed / Blockchain** | 분산스토리지, Proof-of-Replication, Proof-of-Spacetime |
| **Soft Skills** | 장애 대응, 협업, 커뮤니케이션, 보안정책 분석 |

# Linux 기반 환경 구축 로그

## 기간
2025년 9월 ~ 2025년 10월

## 시스템 환경
| 항목 | 내용 |
|------|------|
| OS | Ubuntu 22.04 LTS |
| CPU | AMD Ryzen Threadripper |
| GPU | AMD Radeon RX 580 (OpenCL 지원) |
| Storage | NVMe SSD + HDD Hybrid |

---

## 필수 패키지 설치
```bash
sudo apt install mesa-opencl-icd ocl-icd-opencl-dev gcc git bzr jq pkg-config curl clang build-essential hwloc libhwloc-dev -y
sudo apt upgrade -y

**Docker 환경 구성 및 서비스 운영 관련 기술로그**

```markdown
# Docker 기반 노드 운영 환경 구성 로그

## 데이터 경로 바인딩 및 컨테이너 실행
```bash
sudo systemctl stop docker
sudo mount --bind /home/<usrhome>/docker_s /var/lib/docker
sudo systemctl start docker
docker pull <service_image_name>
docker run -d --name compute-node -v /home/<usrhome>/docker_s:/data <service_image_name>
docker exec -it compute-node /bin/bash


**시스템 운영 / 자원 관리 / 성능 최적화 기록**

```markdown
# System Operations and Optimization Log  
**기간:** 2025년 9월 ~ 2025년 10월  
**환경:** Ubuntu 22.04 LTS / AMD CPU / GPU(OpenCL) / NVMe SSD  
```bash
sudo fdisk -l
sudo mount /dev/nvme0n1p1 /data
sudo systemctl enable myservice
---

## 시스템 구축 및 환경 설정
- Linux 서버 환경 세팅, 원격 SSH 접근 구성  
- 디스크 마운트 및 RAID/NVMe 관리  
- 자원 자동 재시작(systemd), 로그 관리 자동화

---

## 네트워크 구성
- Port forwarding / 방화벽 규칙 설정  
- 체인 통신용 포트 오픈 및 NAT 구성  
- 네트워크 성능 점검(`iperf3`, `ping`, `netstat`)
sudo ufw allow 22/tcp
sudo ufw allow 1234/tcp
sudo ufw enable
---

## 배포 및 버전 관리
- 설정 파일 자동 동기화(`rsync`, `scp`)  
- 환경변수/버전 업데이트 자동화  
- Worker 환경 구성 및 연결 테스트
rsync -avz config/ user@192.168.1.10:/opt/config/
scp setup.sh worker01:/home/user/
---

## 연산 프로세스 관리
- GPU/CPU 자원 사용률 분석(`nvidia-smi`, `htop`)  
- 병렬 연산 스케줄링(hwloc 기반)  
- I/O 병목 및 프로세스 중단 시 재시작 자동화
htop
nvidia-smi
journalctl -u compute-service
---

## 장애 대응 및 검증
- 로그 기반 오류 분석(`journalctl`, `docker logs`)  
- 메모리, 디스크 잔여량 점검(`df -h`, `free -m`)  
- 비정상 종료 프로세스 자동 재시작 스크립트 작성
df -h
free -m
iostat -xm 1 5
---

## 결과 요약
- 리눅스 기반 분산 연산 환경 직접 구축 및 운영  
- 자원 효율 및 시스템 안정성 향상  
- 자동화된 배포 및 로그 추적 프로세스 완성
