FROM ubuntu

RUN apt update
RUN apt install -y python python-pip
RUN pip install redis flask

#ADD ./hello.py /home/python/app/hello.py
RUN useradd --user-group --create-home --shell /bin/false python
ENV HOME=/home/python
ENV NODE_ENV=productin
COPY hello.py $HOME/app
RUN chown -R python:python $HOME/*
USER python
WORKDIR /$HOME/app
#EXPOSE 8000
CMD ["python", "hello.py"]