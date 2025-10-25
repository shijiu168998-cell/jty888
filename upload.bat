@echo off
title 🚀 一键上传网站到 GitHub
color 0a

echo ==========================================
echo    🚀 正在自动上传您的网站到 GitHub...
echo ==========================================

:: 切换到网站文件夹路径
cd /d "C:\Users\ab\Desktop\sp"

:: 设置 Git 用户信息（只需第一次）
git config --global user.name "shijiu168998-cell"
git config --global user.email "shijiu168998@gmail.com"

:: 如果还没初始化 Git（首次运行）
if not exist ".git" (
    echo 🔧 检测到首次运行，正在初始化 Git...
    git init
    git add .
    git commit -m "第一次提交网站文件"
    git branch -M main
    git remote add origin https://github.com/shijiu168998-cell/sp.git
)

:: 如果已存在，则正常提交
echo 📦 正在添加文件...
git add .

echo 📝 正在提交更改...
git commit -m "🚀 自动更新网站 %date% %time%"

echo 🌐 正在推送到 GitHub...
git push -u origin main -f

echo ==========================================
echo ✅ 上传完成！请稍等几分钟后访问：
echo https://shijiu168998-cell.github.io/sp/
echo ==========================================

pause
