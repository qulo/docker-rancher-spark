FROM qulo/spark:spark2.4.0-hadoop3.1.1

ADD entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]