@echo off
title 🚀 九天网站一键上传 GitHub（自动修复所有页面）
color 0a

echo ==========================================
echo 🚀 正在修复并上传您的网站到 GitHub...
echo ==========================================

:: 切换到网站文件夹路径
cd /d "C:\Users\ab\Desktop\sp"

:: 初始化 Git（如果还没初始化）
if not exist ".git" (
    echo 🔧 检测到首次运行，正在初始化 Git...
    git init
)

:: 设置远程仓库（先删除旧的）
git remote remove origin >nul 2>&1
git remote add origin https://github.com/shijiu168998-cell/sp.git

:: 确保 main 分支存在
git branch -M main

:: 检查 images 文件夹是否存在
if not exist "images" (
    echo ⚠️ images 文件夹不存在，请确认图片已放入 images 文件夹
)

:: 检查 JTY.html 是否存在
if not exist "JTY.html" (
    echo ⚠️ JTY.html 不存在，请确认老虎机页已放入仓库根目录
)

:: 重命名 Home.html 为 index.html（如果不是 index.html）
if exist "Home.html" (
    if not exist "index.html" (
        ren Home.html index.html
        echo 🔹 Home.html 已重命名为 index.html
    )
)

:: 添加所有文件
git add .

:: 提交更改（允许空提交）
git commit -m "🚀 自动更新网站及修复路径 %date% %time%" --allow-empty

:: 上传到 GitHub
git push -u origin main -f

echo ==========================================
echo ✅ 上传完成！
echo 🌐 网站主页：https://shijiu168998-cell.github.io/sp/
echo 🌐 老虎机页：https://shijiu168998-cell.github.io/sp/JTY.html
echo ==========================================

pause
