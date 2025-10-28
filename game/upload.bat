<<<<<<< HEAD
@echo off
REM ============================================
REM 🚀 一键上传项目到 GitHub（自动修复错误）
REM 作者：十九
REM ============================================

REM 进入项目目录
cd /d "C:\Users\ab\Desktop\sp\game"

echo --------------------------------------------
echo 🧩 初始化 Git 仓库...
if not exist ".git" (
    git init
)

REM 配置 Git 用户信息
git config user.name "shijiu168998-cell"
git config user.email "shijiu168998@gmail.com"

REM 移除错误的远程仓库并重新添加
echo --------------------------------------------
echo 🔗 检查远程仓库链接...
git remote remove origin 2>nul
git remote add origin https://github.com/shijiu168998-cell/jtybs.git

REM 确保主分支为 main
git branch -M main

REM 添加所有修改
echo --------------------------------------------
echo 🗂️ 添加文件中...
git add .

REM 提交更改
git commit -m "update project files"

REM 同步远程内容（防止 fetch first 错误）
echo --------------------------------------------
echo 🔄 同步远程仓库...
git pull origin main --allow-unrelated-histories

REM 推送到远程仓库
echo --------------------------------------------
echo 🚀 正在推送到 GitHub...
git push -u origin main

if %errorlevel%==0 (
    echo.
    echo ✅ 已成功上传到 GitHub！
    echo 📦 仓库地址：https://github.com/shijiu168998-cell/jtybs
) else (
    echo.
    echo ❌ 上传失败，请检查网络或 Token 是否正确。
)

pause
=======
git clone https://github.com/shijiu168998-cell/jtybs.git

cd C:/ab/Destop/jtybs/index.html

dir
>>>>>>> 78232d721132430da6f07406a066bee8f4be093c
