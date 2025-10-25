C:\Users\ab\Desktop\sp\index.html
git config --global user.name "shijiu168998-cell"
git config --global user.email "shijiu168998@gmail.com"

@echo off
title 🚀 一键上传网站到 GitHub
color 0a

echo ==========================================
echo    🚀 正在自动上传您的网站到 GitHub...
echo ==========================================

:: 切换到网站文件夹路径
cd /d "C:\Users\ab\Desktop\sp\home.html"

:: 如果还没初始化 Git（首次运行）
if not exist ".git" (
    echo 🔧 检测到首次运行，正在初始化 Git...
    git init
    git branch -M main
    git remote add origin https://github.com/shijiu168998-cell/sp/home.html.git
)

:: 添加、提交、推送
git add .
git commit -m "🚀 自动更新网站 %date% %time%"
git push -u origin main

echo ==========================================
echo ✅ 上传完成！请稍等几分钟后访问：
echo https://shijiu168998-cell.github.io/sp
echo ==========================================

pause
