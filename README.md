# PHOTO3D — 多视角照片 & 图纸三维重建系统

> 上传图片或工程图纸，自动生成可下载的三维模型（GLB / OBJ / STL）

## 功能模块

| 模块 | 说明 |
|------|------|
| 📷 多视角照片重建 | 上传 10–200 张环绕照片，经 SfM + MVS 生成密集网格 |
| 📐 图纸自动建模 | 上传 DWG / DXF / PDF / PNG 图纸，AI 解析后推拉建模 |
| 🗂️ 个人空间 | 模型库管理，支持搜索、筛选、重命名、下载 |

## 技术栈

**后端** — FastAPI · Celery · Redis · pycolmap · Open3D · Trimesh · Claude Vision API

**前端** — 纯 HTML/CSS/JS · Canvas 银河系动画 · 侧边栏双栏布局

## 快速开始

```bash
git clone https://github.com/YOUR_USERNAME/photo3d.git
cd photo3d/backend
pip install -r requirements.txt
python scripts/check_env.py   # 检测环境
docker-compose up             # 启动所有服务
open ../frontend/index.html   # 打开前端
```

API 文档：http://localhost:8000/docs

## 目录结构

```
photo3d/
├── frontend/index.html       # 前端单文件应用
├── backend/
│   ├── app/                  # FastAPI 应用
│   │   ├── api/routes.py     # API 路由
│   │   ├── core/             # SfM / MVS / 后处理
│   │   ├── services/         # 图像质量检测
│   │   ├── models/schemas.py # 数据模型
│   │   └── workers/tasks.py  # Celery 任务
│   ├── tests/
│   ├── scripts/check_env.py
│   ├── requirements.txt
│   ├── Dockerfile
│   └── docker-compose.yml
└── README.md
```

## License

MIT
