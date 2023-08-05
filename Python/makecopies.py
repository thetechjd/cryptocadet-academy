import shutil

original=r'../Resources/test_metadata/1.json'



for x in range(1,101):
    target = r'../Resources/test_metadata/'+str(x)+'.json'
    shutil.copyfile(original, target)