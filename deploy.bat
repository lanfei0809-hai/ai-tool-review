@echo off
echo === AI Tool Review - Deploy to GitHub Pages ===
echo.
echo Prerequisites:
echo   1. GitHub repo created at: github.com/YOUR_USERNAME/ai-tool-review
echo   2. Git installed and configured
echo   3. GitHub Pages enabled in repo Settings (source: GitHub Actions)
echo.

cd /d C:\Users\86113\.openclaw\workspace\projects\auto-income

REM Initialize git if not already done
if not exist ".git" (
    echo [1/4] Initializing git repo...
    git init
    git checkout -b main
)

REM Ensure we're on main branch
git checkout main 2>nul

REM Copy site files if needed (site is already there)
echo [2/4] Adding files...
git add site/ README.md .github/

REM Create .github workflow for GitHub Pages
mkdir .github\workflows 2>nul
echo name: Deploy to GitHub Pages > .github\workflows\deploy.yml
echo on: >> .github\workflows\deploy.yml
echo   push: >> .github\workflows\deploy.yml
echo     branches: [main] >> .github\workflows\deploy.yml
echo jobs: >> .github\workflows\deploy.yml
echo   deploy: >> .github\workflows\deploy.yml
echo     runs-on: ubuntu-latest >> .github\workflows\deploy.yml
echo     permissions: >> .github\workflows\deploy.yml
echo       contents: read >> .github\workflows\deploy.yml
echo       pages: write >> .github\workflows\deploy.yml
echo       id-token: write >> .github\workflows\deploy.yml
echo     steps: >> .github\workflows\deploy.yml
echo       - uses: actions/checkout@v4 >> .github\workflows\deploy.yml
echo       - uses: actions/configure-pages@v4 >> .github\workflows\deploy.yml
echo       - uses: actions/upload-pages-artifact@v3 >> .github\workflows\deploy.yml
echo         with: >> .github\workflows\deploy.yml
echo           path: site/ >> .github\workflows\deploy.yml
echo       - uses: actions/deploy-pages@v4 >> .github\workflows\deploy.yml

git add .github/

echo [3/4] Committing...
git commit -m "Initial deploy: AI Tool Review site with 3 articles" 2>nul

echo [4/4] Ready to push.
echo.
echo Run this to deploy:
echo   git remote add origin https://github.com/YOUR_USERNAME/ai-tool-review.git
echo   git push -u origin main
echo.
echo Then enable GitHub Pages in repo Settings ^> Pages ^> Source: GitHub Actions
echo Site will be live at: https://YOUR_USERNAME.github.io/ai-tool-review/
