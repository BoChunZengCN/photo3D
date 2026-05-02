@echo off
chcp 65001 >nul
title Photo3D 后端服务

echo ====================================================
echo   Photo3D 后端服务 启动器
echo ====================================================
echo.

:: 检查 Python 是否安装
python --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Python，请先安装 Python 3.8+
    echo 下载地址：https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

echo [1/3] 检测到 Python:
python --version
echo.

:: 安装依赖
echo [2/3] 安装依赖包（首次运行需要1-3分钟）...
pip install flask opencv-python-headless numpy Pillow -q
if errorlevel 1 (
    echo [错误] 依赖安装失败，请检查网络连接
    pause
    exit /b 1
)
echo 依赖安装完成 ✓
echo.

:: 启动服务
echo [3/3] 启动 Photo3D 服务...
echo.
echo ====================================================
echo   服务地址：http://localhost:5000
echo   保持此窗口开着，关闭窗口即停止服务
echo ====================================================
echo.

:: 检查 server.py 是否在同一目录
if not exist "%~dp0photo3d_server.py" (
    echo [错误] 找不到 photo3d_server.py
    echo 请确保 photo3d_server.py 和本文件在同一个文件夹里
    echo.
    pause
    exit /b 1
)

python "%~dp0photo3d_server.py"

echo.
echo 服务已停止
pause
