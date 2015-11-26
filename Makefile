all: beancounter.so

clean:
	rm -rf *.o *.so

install: all
	cp beancounter.so /usr/lib/collectd/
	cp beancounter-types.db /etc/collectd/types/

beancounter.o: beancounter.c
	gcc -c -Wextra -Wall -fpic -o $@ $^

beancounter.so: beancounter.o
	gcc -shared -o $@ $^
