FROM gettyimages/spark

ADD start.sh .

ENTRYPOINT ["start.sh"]

