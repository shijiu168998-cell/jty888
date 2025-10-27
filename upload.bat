@echo off
chcp 65001 >nul
title 🚀 九天一键上传网站到 GitHub（自动修复）
color 0a

echo ==========================================
echo 🚀 正在自动修复并上传网站到 GitHub...
echo ==========================================

cd /d "C:\Users\ab\Desktop\sp"

git add .
git commit -m "🚀 自动修复并上传网站 %date% %time%" --allow-empty
git push -u origin main -f

echo ==========================================
echo ✅ 上传完成！
echo 🌐 访问网址：https://shijiu168998-cell.github.io/sp/gallery.html
echo ==========================================

git 克隆 git://github.com/xdebug/xdebug.git

pause
