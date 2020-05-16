FROM python:3-slim

RUN apt-get update
RUN apt-get install -y socat

RUN adduser --disabled-password --gecos '' reflect && chown -R root:reflect /home/reflect/ && chmod 770 /home/reflect && export TERM=xterm

WORKDIR /home/reflect/
COPY requirements.txt /home/reflect/requirements.txt
RUN pip install -r requirements.txt

COPY src/bob.py /home/reflect/bob.py
RUN chmod 770 /home/reflect/bob.py

RUN touch .PSK && python -c "from Crypto.Random import get_random_bytes;f = open('.PSK', 'wb');f.write(get_random_bytes(16));f.close();"

CMD socat -v -v -T30 TCP-LISTEN:50000,reuseaddr,fork EXEC:/home/reflect/bob.py
