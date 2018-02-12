FROM qulo/spark:release-2.1.2

ADD entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]