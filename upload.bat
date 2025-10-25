@echo off
title 九天一键上传网站到 GitHub（自动修复 + 图片路径处理）
color 0a

echo ==========================================
echo 正在上传您的网站到 GitHub...
echo ==========================================

:: 切换到网站文件夹路径
cd /d "C:\Users\ab\Desktop\sp"

:: 初始化 Git（如果还没初始化）
if not exist ".git" (
    echo 检测到首次运行，正在初始化 Git...
    git init
)

git pull origin main --allow-unrelated-histories


:: 添加远程仓库（先删除旧的）
git remote remove origin >nul 2>&1
git remote add origin https://github.com/shijiu168998-cell/sp.git

:: 创建 main 分支
git branch -M main

:: ===============================
:: 修复 HTML 中的图片路径大小写
:: ===============================
echo 正在修复 HTML 文件中的图片路径...
for /r %%f in (*.html) do (
    set "file=%%f"
    call :FixImages "%%f"
)

:: 添加所有文件
git add .

:: 提交更改（允许空提交）
git commit -m "自动更新网站 %date% %time%" --allow-empty

:: 上传到 GitHub
git push -u origin main -f

echo ==========================================
echo 上传完成！
echo 访问网址：https://shijiu168998-cell.github.io/sp/home.html

echo ==========================================

pause
exit

:: -------------------------------
:FixImages
setlocal enabledelayedexpansion
set "htmlfile=%~1"
:: 使用 PowerShell 修改 <img src="..."> 为小写路径
powershell -Command "(Get-Content '%htmlfile%') -replace 'src\s*=\s*\"([^\"]+)\"','src=\"$([regex]::match($1,'.*').Value.ToLower())\"' | Set-Content '%htmlfile%'"
endlocal
goto :eof


git add .
git commit -m "创建 home 目录并添加主页"
git push origin main
