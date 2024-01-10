import json
import zipfile
import os

api_token = {"username":"jasminoyo","key":"0ff7fdee37b266a235f2f1b5f4c7eb0c"} ##contenido de archivo kaggle.json

##conectar a kaggle
with open ('C:/Users/JSM/.kaggle/kaggle.json','w') as file:
    json.dump(api_token,file)

location = "C:/Users/JSM/Documents/proyecto_parcial/dataset"

##Validar que la carpeta exista
if not os.path.exists(location):
    ##si no existe la carpeta dataset la creo
    os.mkdir(location)
else:
    ##si la carpeta existe , entonces borro contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) ##elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) ## elimino todas las carpetas
## Descargar dataset de kaggle
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/JSM/Documents/proyecto_parcial/dataset")

##Descomprimir el archivo de kaggle
os.chdir(location)
for file in os.listdir():
    zip_ref=zipfile.ZipFile(file,"r") ##lee archivo .zip
    zip_ref.extractall() ##extrae contenido de archivo .zip
    zip_ref.close()##cierra archivo

###scrip que cree una tabla starbucks
### crear el pipelinne

