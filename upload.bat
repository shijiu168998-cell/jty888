@echo off
chcp 65001 >nul
title 🚀 自动上传网站到 GitHub
color 0a

echo ==========================================
echo 🚀 正在自动修复并上传网站到 GitHub...
echo ==========================================

cd /d "C:\Users\ab\Desktop\sp"

echo 🔧 修复图片路径与更新文件...
git add .
git commit -m "🚀 自动修复图片并上传网站"
git push -u origin main

echo ==========================================
echo ✅ 上传完成！
echo 🌐 访问网址：
echo https://shijiu168998-cell.github.io/sp/gallery.html
echo ==========================================

pause
