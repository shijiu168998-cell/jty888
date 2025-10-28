@echo off
chcp 65001 >nul
title 🚀 九天一键修复并上传网站到 GitHub Pages
color 0a


echo ==========================================
echo   🚀 正在修复并上传您的网站到 GitHub...
echo ==========================================

:: 切换到你的网站目录
cd /d "C:\Users\ab\Desktop\jtybs"

:: 初始化 Git（如果没有）
if not exist ".git" (
    echo 🔧 检测到首次运行，正在初始化 Git...
    git init
)

:: 删除旧的远程仓库并重新添加
git remote remove origin >nul 2>&1
git remote add origin https://github.com/shijiu168998-cell/jtybs.git

:: 分支设置为 main
git branch -M main

:: 自动把 Home.html 改成 index.html（如果存在）
if exist "Home.html" (
    echo 🧩 正在将 Home.html 重命名为 index.html ...
    ren "Home.html" "index.html"
)

:: 添加所有文件
git add .

:: 提交更新
git commit -m "🚀 自动修复并上传网站 %date% %time%" --allow-empty

:: 推送到 GitHub
git push -u origin main -f

echo ==========================================
echo ✅ 上传完成！
echo 🌍 您的网站地址：
echo https://shijiu168998-cell.github.io/jtybs/
echo ==========================================

pause
