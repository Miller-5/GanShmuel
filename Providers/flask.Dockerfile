FROM python:3.6.9-alpine
RUN apk update && apk add mariadb-dev
RUN echo "http://dl-8.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk add py3-numpy py3-pandas
RUN pip install --upgrade pip
COPY . /
COPY alp-sql.sh /alp.sh
RUN chmod +x /alp.sh
RUN ./alp.sh
#RUN export FLASK_APP=app.py
#COPY . /
CMD ["python", "./app.py"]
#RUN pipreqs /app
#RUN pip install -r /app/requirements.txt
#RUN pip unistall pipreqs
