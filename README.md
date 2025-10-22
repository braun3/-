
# 포트폴리오

공공기관에서 보안관제·시스템 운영 경험이 있습니다.
자동화 구축 중심의 실무 경험을 기술적으로 정리한 포트폴리오입니다.  
리눅스 인프라 기반 환경에서 보안, 운영, 자동화 및 분산 연산 시스템을 구축·운용한 경험을 중심으로 기술했습니다.

---

## 경력 요약

- **경력 분야:** 보안관제, 정보보호시스템 운영, 인프라 관리, 자동화 구축  
- **핵심 역할:** 침해 이벤트 분석 및 대응 / 시스템 장애 복구 / 자동화 및 효율화  
- **강점 요약:**  
  • 공공기관 장비 운영과 관제 업무를 통한 실무 경험 기반의 위협 분석 및 대응 능력  
  • 리눅스·네트워크 중심의 시스템 기술 역량  
  • Pyhton, Shellsciprt 을 활용한 시스템 운영 자동화 및 로그 정규화 능력  
  • 협업·커뮤니케이션 역량 (지방청, 부서 간 장애 대응 협업 경험)

---

## 기술 스택

| 분야 | 주요 기술 |
|------|------------|
| **OS / Infra** | Linux (Ubuntu), JBOD, RAID, iSCSI, LVM |
| **Network** | VLAN, LACP, MTU 9000, TCP/IP |
| **Security** | IDS/IPS, ESM, FW, DLP, 시그니처 룰 관리, 탐지 이벤트 분석 |
| **Automation / Scripting** | Python(로그 파싱, API 연동, 자동화 스크립트), Bash |
| **Distributed / Blockchain** | 분산스토리지, Proof-of-Replication, Proof-of-Spacetime |
| **Soft Skills** | 장애 대응, 협업, 커뮤니케이션, 보안정책 분석 |

## 인프라 환경 구성 (Infrastructure Stack)

### Storage & Controller
- **JBOD System:** JBOD Storage  
- **Controller:** MegaRAID (SAS/SATA Hybrid)  
- **External Cabling:** SFF-8624 SAS External Cable  
- **Storage Tiering:**  
  - NVMe SSD (Primary Tier)  
  - SATA SSD (Cache / Secondary Tier)  
  - HDD (Cold Storage Tier)

---

### Compute Node #1
| 구성 | 사양 |
|------|------|
| **Mainboard** | Gigabyte MZ32-AR0 (Server Grade) |
| **CPU** | AMD EPYC 7302P (16C / 32T / 2.5GHz / 128MB L3) |
| **Memory** | Samsung REG ECC DDR4 64GB |
| **NVMe SSD (OS)** | Samsung 980 EVO 1TB |
| **NVMe SSD (Data)** | Samsung PM1733 3.84TB |
| **HDD (Storage)** | WD HC550 18TB SATA |
| **RAID Controller** | MegaRAID CLA4448 |
| **Network** | Intel X550-T2 10GbE NIC |
| **GPU** | Gigabyte RTX 3060 |
| **Cooling** | TR4 Active Cooler |

---

### Compute Node #2
| 구성 | 사양 |
|------|------|
| **Mainboard** | Gigabyte / ASRock B550 |
| **CPU** | AMD Ryzen 7 5600X |
| **Memory** | Samsung DDR4 3200MHz 32GB |
| **Storage** | FireCuda 520 NVMe 1TB + 2TB |
| **GPU** | RTX 3060 Gaming OC 12GB (Rev 2.0) |
| **Power Supply** | Micronics Astro GD750W Full Moduler |

---

### Network & Power Topology
- **Network Interface:** Intel X550-T2 (10GbE Dual Port)  
- **LACP Bonding / VLAN Segmentation** 적용  
- **Jumbo Frame (MTU 9000)** 구성  
- **JBOD – Compute 간 DAS 연결 (SAS 12Gb/s)**  
- 내부 노드 간 전송속도 약 8~9Gbps 확인
- **Switching Layer:** 10G UTP 16-Port Managed Switch 구성  
  - VLAN 분리 및 LACP Aggregation 적용  
  - Jumbo Frame (MTU 9000) 활성화  
  - 모듈 간 Bandwidth Balance 조정으로 Throughput 최적화  
- **Backbone Interconnect:** 40G Optical Module (4x10G Aggregation) 기반  
  - 고대역폭 JBOD ↔ Compute Node 전송 구성  
  - 광 트랜시버 및 DAC 기반 케이블링 최적화  
- **Power Redundancy:** UPS 80kW (30min Backup Time)  
  - 장애 시 데이터 유실 방지 및 안전한 Graceful Shutdown 자동화  
  - UPS Status를 Bash 스크립트로 모니터링 및 알림 연동

---

### 기술적 포인트
- NVMe Tier + SATA Tier + HDD Tier의 **계층형 스토리지 구조 설계**
- MegaRAID 기반 JBOD 환경 구성으로 **고가용성(HA) 확보**
- GPU (RTX 3060) 기반 병렬 연산 환경 운용
- 10GbE LACP 네트워크 구성으로 데이터 처리 대역폭 최적화
- Linux 환경에서 JBOD, RAID, iSCSI 및 hwloc 연동 테스트 완료


# Linux 기반 환경 구축 로그

## 시스템 환경
| 항목 | 내용 |
|------|------|
| **운영체제(OS)** | Ubuntu 22.04 LTS |
| **Compute Node #1** | Gigabyte MZ32-AR0 / AMD EPYC 7302P (16C 32T / 2.5GHz / 128MB L3) / ECC DDR4 64GB |
| **Compute Node #2** | Gigabyte B550 / Ryzen 7 5600X / DDR4 32GB |
| **GPU** | RTX 3060 12GB |
| **Storage (Tiered)** | NVMe SSD (980 EVO 1TB, PM1733 3.84TB) + HDD (HC550 18TB) |
| **Network** | Intel X550-T2 10GbE / VLAN / LACP / MTU 9000 |
| **Power & UPS** | UPS 80kW (Backup 30min) |

---

## 필수 패키지 설치

* 환경 구축
```bash
sudo apt install mesa-opencl-icd ocl-icd-opencl-dev gcc git bzr jq pkg-config curl clang build-essential hwloc libhwloc-dev -y
  ## 기술적 목적
  - OpenCL 기반 연산을 위한 GPU 런타임 환경 구성
  - C/C++ 빌드 및 헤더 세팅
  - CPU 자원 최적화를 위한 hwloc 기반 토폴로지 인식 구성

* 시스템 리소스 확장 및 개발 환경 구축
  # Swap Memory 구성
  ```bash
  sudo fallocate -l 16G /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  ## 기술적 목적
    - 메모리 사용량이 높은 연산 작업 환경에서 **임시 스왑 메모리 영역 추가 설정**  
    - 물리 RAM 부족 시 디스크 공간을 가상 메모리로 활용해 연산 안정성 확보


  # Go 버전 수동 설치를 통해 애플리케이션 빌드·실행 환경 직접 구성
  ```bash
  sudo wget https://dl.google.com/go/go1.<버전>.linux-amd64.tar.gz
  sudo tar -zxvf go1.<버전>.linux-amd64.tar.gz -C /usr/local
  # 환경변수등록
  export GOROOT=/usr/local/go
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  source ~/.bashrc
  ## 기술적 목적
    - 메모리 사용량이 높은 연산 작업 환경에서 **임시 스왑 메모리 영역 추가 설정**  
    - 물리 RAM 부족 시 디스크 공간을 가상 메모리로 활용해 연산 안정성 확보
```

---

## Docker 기반 노드 운영 환경 구성 로그
# 자동 설치 및 초기화 스크립트 구성
  - 목적: 신규 Ubuntu 서버 환경 자동 초기화 및 Docker 배포 자동화  
  - 언어: Bash Shell Script  
  - 주요 기능:  
    - Docker 및 Python3 자동 설치  
    - GPG 키 등록 및 APT Repository 자동 구성  
    - 서비스 자동 시작(systemctl enable)  
    - 사용자 그룹 설정 및 권한 부여  
    - 절전 기능 비활성화로 장시간 연산 환경 안정화  
  - 특징: 비대화식 설치 및 오류 감지 로직 내장  
  - 적용 예시: 
    ```bash
    sudo bash install_docker.sh
    ```
    *(상세 스크립트는 [install_docker.sh](./install_docker.sh) 참조)*
    
# 데이터 경로 바인딩 및 컨테이너 실행
```bash
sudo systemctl stop docker
sudo mount --bind /home/<usrhome>/docker_s /var/lib/docker
sudo systemctl start docker
docker pull <service_image_name>
docker run -d --name compute-node -v /home/<usrhome>/docker_s:/data <service_image_name>
docker exec -it compute-node /bin/bash
```
---

**시스템 운영 / 자원 관리 / 성능 최적화 기록**
```
# 시스템 구축 및 환경 설정
- Linux 서버 환경 세팅, 원격 SSH 접근 구성  
- 디스크 마운트 및 RAID/NVMe 관리  
- 자원 자동 재시작(systemd), 로그 관리 자동화
- 대용량 데이터 처리를 위한 스토리지 환경을 ZFS 기반 RAID5로 구성
```bash
sudo fdisk -l
sudo mount /dev/nvme0n1p1 /data
sudo systemctl enable myservice

# 네트워크 구성
- Port forwarding / 방화벽 규칙 설정  
- 체인 통신용 포트 오픈 및 NAT 구성  
- 네트워크 성능 점검(`iperf3`, `ping`, `netstat`)
sudo ufw allow 22/tcp
sudo ufw allow <통신port>/tcp
sudo ufw enable


# 배포 및 버전 관리
- 설정 파일 자동 동기화(`rsync`, `scp`)  
- 환경변수/버전 업데이트 자동화  
- Worker 환경 구성 및 연결 테스트
rsync -avz config/ user@<node_ip>:/opt/config/
scp setup.sh worker01:/home/user/


# 연산 프로세스 관리
- GPU/CPU 자원 사용률 분석(`nvidia-smi`, `htop`)  
- 병렬 연산 스케줄링(hwloc 기반)  
- I/O 병목 및 프로세스 중단 시 재시작 자동화
htop
nvidia-smi
journalctl -u compute-service

# 장애 대응 및 검증
- 로그 기반 오류 분석(`journalctl`, `docker logs`)  
- 메모리, 디스크 잔여량 점검(`df -h`, `free -m`)  
- 비정상 종료 프로세스 자동 재시작 스크립트 작성
df -h
free -m
iostat -xm 1 5
---
```
## 자동화 및 스크립트 기술
```
  # Shell Script 기반 자동화
  - 목적: 반복적인 노드 작업(연산 큐 확인, 상태 점검, Deal 트리거 등) 자동화  
  - 기능 개요:
    - 작업 큐 상태 모니터링 및 조건부 실행  
    - SSH 원격 명령 수행 및 로그 수집  
    - 자동 재시작 및 처리량 제한 로직 내장  
    - Slack 등 외부 API 연동을 통한 상태 알림  
  - 적용 기술: Bash, sshpass, systemd timer, API 호출 자동화
```
  - 상세 스크립트: [auto_task.sh](./auto_task.sh)

```
  # Python 기반 로그 파싱 및 알림 시스템
  - 목적: 노드 상태 및 로그 데이터를 주기적으로 수집하여 Slack 알림으로 전송  
  - 기능 개요:
    - REST API 호출을 통한 JSON 로그 데이터 수집  
    - 필드 필터링 및 유효성 검증 후 메시지 생성  
    - Slack Webhook으로 실시간 알림 전송  
    - `addr.txt` 기반 멀티 노드 대상 병렬 처리 구조  
  - 적용 기술: Python, Requests, JSON 파싱, Slack API 연동
```
  - 상세 스크립트: [log_alert.py](./log_alert.py)

---

## 결과 요약
- 리눅스 기반 분산 연산 환경 직접 구축 및 운영  
- 자원 효율 및 시스템 안정성 향상  
- 자동화된 배포 및 로그 추적 프로세스 완성

