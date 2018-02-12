FROM qulo/spark:release-2.2.1

ADD entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]