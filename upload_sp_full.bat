@echo off
title JTY-888 Website Upload
color 0a

echo ==========================================
echo Uploading website to GitHub...
echo ==========================================

cd /d "C:\Users\ab\Desktop\sp"

if not exist ".git" (
    git init
)

git remote remove origin >nul 2>&1
git remote add origin https://github.com/shijiu168998-cell/sp.git

git branch -M main

if exist "Home.html" if not exist "index.html" ren Home.html index.html

git add .
git commit -m "Update website %date% %time%" --allow-empty
git push -u origin main -f

echo ==========================================
echo Upload complete!
echo Website homepage: https://shijiu168998-cell.github.io/sp/
echo Slots page: https://shijiu168998-cell.github.io/sp/JTY.html
echo ==========================================

pause
