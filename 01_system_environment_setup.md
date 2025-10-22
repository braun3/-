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
