@echo off
title 九天一键上传网站到 GitHub（自动修复）
color 0a

echo ==========================================
echo   正在自动上传您的网站到 GitHub...
echo ==========================================

:: 切换到网站文件夹路径
cd /d "C:\Users\ab\Desktop\sp"

:: 初始化 Git（如果还没初始化）
if not exist ".git" (
    echo 检测到首次运行，正在初始化 Git...
    git init
)

:: 添加远程仓库（先删除旧的）
git remote remove origin >nul 2>&1
git remote add origin https://github.com/shijiu168998-cell/sp-website.git

:: 创建 main 分支
git branch -M main

:: 添加所有文件
git add .

:: 提交更改（允许空提交）
git commit -m "自动更新网站 %date% %time%" --allow-empty

:: 上传到 GitHub
git push -u origin main -f

echo ==========================================
echo 上传完成！
echo 访问网址：https://shijiu168998-cell.github.io/sp
echo ==========================================

pause
