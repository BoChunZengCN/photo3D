# PHOTO3D — 多视角照片转三维模型系统

> 上传多张环绕照片，自动生成可下载的三维模型（GLB / OBJ / STL）

![Tech Stack](https://img.shields.io/badge/Frontend-HTML%2FJS%2FCSS-cyan)
![Backend](https://img.shields.io/badge/Backend-Flask%20%2B%20OpenCV-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 功能模块

| 模块 | 说明 |
|------|------|
| 📷 多视角照片重建 | 上传 10–200 张环绕照片，自动生成三维网格模型 |
| 📐 图纸自动建模 | 上传工程图纸（DWG/DXF/PDF/PNG），AI 解析后推拉建模 |
| 🗂️ 个人空间 | 模型库管理，支持搜索、筛选、重命名、下载 |

## 界面预览

- 深空控制台风格（黑底 + 青绿色调）
- 银河系动态粒子背景（星云 + 流星效果）
- 三个 Tab 页签切换：照片重建 / 图纸建模 / 个人空间
- 实时重建进度展示（四阶段进度条）

## 快速开始

### 1. 启动后端（Windows 双击）

把 `启动Photo3D服务.bat` 和 `backend/server.py` 放在同一文件夹，双击 `.bat` 文件即可。

### 2. 启动后端（命令行）

```bash
# 安装依赖
pip install flask opencv-python-headless numpy Pillow

# 启动服务
python backend/server.py

# 服务运行在 http://localhost:5000
```

### 3. 打开前端

用浏览器打开 `frontend/index.html`，确认顶部 API 地址：

```js
const API = 'http://localhost:5000/api/v1';
```

## API 接口

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | `/api/v1/health` | 健康检查 |
| POST | `/api/v1/jobs` | 创建重建任务，上传图片 |
| GET | `/api/v1/jobs/{id}` | 查询任务状态和进度 |
| GET | `/api/v1/jobs/{id}/result` | 获取结果下载链接 |
| GET | `/api/v1/jobs/{id}/download/{fmt}` | 下载模型文件 |
| DELETE | `/api/v1/jobs/{id}` | 删除任务 |

## 目录结构

```
photo3D/
├── frontend/
│   └── index.html          # 前端单文件应用（含完整样式和交互）
├── backend/
│   ├── server.py           # Flask 后端服务（单文件）
│   ├── requirements.txt    # 完整依赖（含 pycolmap / open3d）
│   └── Dockerfile          # Docker 构建文件
├── docs/
├── docker-compose.yml      # Docker Compose 配置
├── 启动Photo3D服务.bat      # Windows 一键启动脚本
└── README.md
```

## 技术栈

**前端**
- 纯 HTML / CSS / JavaScript（无框架依赖）
- Canvas 银河系动态背景
- 三 Tab 布局：照片重建 / 图纸建模 / 个人空间

**后端（当前单文件版）**
- Flask + OpenCV + NumPy + Pillow
- 图像质量检测（Laplacian 模糊判断）
- 多线程异步重建任务
- 生成标准 OBJ / GLB（glTF 2.0）/ STL 文件

**后端（完整版，需 GPU）**
- FastAPI + Celery + Redis
- pycolmap（SfM 相机位姿估计）
- Open3D + Trimesh（密集重建 + 网格处理）

## 拍摄规范

- **覆盖范围**：围绕目标 360° 等间距拍摄，每 10–15° 一帧
- **重叠率**：相邻图片重叠率 > 60%
- **光线**：漫射均匀光，避免强光直射
- **最少图片**：10 张，推荐 20–80 张

## License

MIT
