
# Kaggle Boat

Sandboxed jupyter environment for experimenting with Kaggle's machine learning excercise, Titanic

https://www.kaggle.com/c/titanic

If utilizing the docker container, specify ports and be sure to mount host directory to volume /opt/py-app (or else specify a different working directory in the dockerfile). 

e.g. 

docker run -it -p 1400:8888 -v /path/to/host/directory/py-app:/opt/py-app jupyter-test