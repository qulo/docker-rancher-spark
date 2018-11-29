FROM qulo/spark:spark2.3.2-hadoop2.9.1

ADD entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]