FROM python:3

ARG APP_DIR=/Users/krzysztof/Projects/python/se_hello_printer_app

WORKDIR /tmp
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p $APP_DIR
ADD hello_world/ $APP_DIR/hello_world/
ADD main.py $APP_DIR

CMD PYTHONPATH=$PYTHONPATH:/Users/krzysztof/Projects/python/se_hello_printer_app \
        FLASK_APP=hello_world flask run --host=0.0.0.0:3000