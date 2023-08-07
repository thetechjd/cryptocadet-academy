import os


files = os.listdir('../Resources/test_metadata/')


count = 1



for x in files:
    with open('../Resources/test_metadata/'+str(count)+'.json', 'rb') as file :
        filedata = file.read()
        
    # Replace the target string
    filedata = filedata.replace(bytes('REPLACE-THIS-WITH-YOUR-URL', encoding='utf-8'),
                                bytes('ipfs://QmfREPLACEMENTHASHhatseKKrtYZHZJ', encoding='utf-8'))
        # Write the file out again
    with open('../Resources/test_metadata/'+str(count)+'.json', 'wb') as file:
        file.write(filedata)
    count=count+1



  

