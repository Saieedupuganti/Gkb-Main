import os

cmds = '''cd..
git add .
git commit -m "Your commit message"
git checkout main
git merge --no-ff k30
git push origin main
git checkout k30'''
for i in cmds.splitlines():
  os.system(i)




