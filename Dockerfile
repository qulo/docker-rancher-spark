FROM gettyimages/spark

RUN pip install numpy

ADD start.sh .

ENTRYPOINT ["./start.sh"]