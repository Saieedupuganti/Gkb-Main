import os

cmds = '''cd..
git add .
git commit -m "Harsha update"
git checkout main
git merge --no-ff v12
git push origin main
git checkout v12'''
for i in cmds.splitlines():
  os.system(i)




