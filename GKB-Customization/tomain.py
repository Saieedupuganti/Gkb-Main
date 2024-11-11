import os

cmds = '''cd..
git add .
git commit -m "Your commit message"
git checkout main
git merge --no-ff v11
git push origin main
git checkout v11'''
for i in cmds.splitlines():
  os.system(i)

