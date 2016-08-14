#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SCRIPT	"/usr/local/bin/synclient-settings"

int main(int argc, char *argv[])
{
	int uid = getuid();
	setuid(0);
	system("rmmod psmouse");
	system("modprobe psmouse");
	setuid(uid);
	sleep(3);
	system(SCRIPT);
	return 0;
}
