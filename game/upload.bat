@echo off
REM ============================================
REM 🚀 一键上传项目到 GitHub（自动修复常见错误）
REM 作者：ChatGPT
REM ============================================

REM 进入项目目录
cd /d "C:\Users\ab\Desktop\sp\game"

echo --------------------------------------------
echo 🧩 清理 Git 锁文件和残留子模块...
if exist ".git/index.lock" del /f /q ".git/index.lock"
if exist ".gitmodules" del /f /q ".gitmodules"
git submodule deinit -f --all 2>nul

REM 初始化 Git 仓库（如果尚未初始化）
if not exist ".git" (
    git init
)

REM 配置 Git 用户信息
git config user.name "shijiu168998-cell"
git config user.email "shijiu168998@gmail.com"

REM 重置远程仓库（防止错误）
git remote remove origin 2>nul
git remote add origin https://github.com/shijiu168998-cell/jtybs.git

REM 确保主分支为 main
git branch -M main

REM 添加并提交修改
git add .

REM 如果 HEAD 锁定报错，先重置索引
if exist ".git/index.lock" del /f /q ".git/index.lock"
git reset --mixed

git commit -m "update project files" 2>nul

REM 同步远程分支，允许合并不同历史
git fetch origin main
git merge origin/main --allow-unrelated-histories -m "Merge remote changes"


REM 推送到远程仓库（强制推送以覆盖远程）
git push -f origin main

REM 检查推送结果
if %errorlevel%==0 (
    echo.
    echo ✅ 已成功上传到 GitHub！
    echo 📦 仓库地址：https://github.com/shijiu168998-cell/jtybs
    start https://github.com/shijiu168998-cell/jtybs
) else (
    echo.
    echo ❌ 上传失败，请检查网络或 GitHub Token。
)

pause
