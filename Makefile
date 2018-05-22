all: beancounter.so

clean:
	rm -rf *.o *.so

install: all
	cp beancounter.so /usr/lib/collectd/
	install beancounter-types.db -D --target-directory=/etc/collectd/types/

beancounter.o: beancounter.c
	gcc -c -Wextra -Wall -fpic -o $@ $^

beancounter.so: beancounter.o
	gcc -shared -o $@ $^
