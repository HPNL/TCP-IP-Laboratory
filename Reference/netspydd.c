/******************************************/
/* netspyd.c                              */
/*                                        */
/* Written by Dr Shiwen Mao               */
/* Dept. ECE, Polytechnic University      */
/*                                        */
/* 7/17/2003                              */
/******************************************/
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h> /* close */
#include <utmp.h>
#include <time.h>
#include <sys/timeb.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>
#define MAX_LOGIN 256
int main(int argc, char *argv[])
{
    int sd, i;
    unsigned char ttl;
    struct sockaddr_in cliAddr, servAddr;
    struct hostent *h;
    int SERVER_PORT;
    char ampm[] = "AM";
    struct tm *today;
    char hostn[128];
    char message[200];
    struct utmp *upt_var;
    struct utmp old_utmp[MAX_LOGIN];
    int flags[MAX_LOGIN];
    int old_len, found = -1;
    old_len = 0;
    for (i = 0; i < MAX_LOGIN; i++)
    {
        flags[i] = -1;
    }
    gethostname(hostn, sizeof(hostn));
    if (argc != 4)
    {
        printf("usage netspyd <mgroup_addr> <port_number> <TTL_value>\n");
        exit(1);
    }
    ttl = atoi(argv[3]);
    SERVER_PORT = atoi(argv[2]);
    h = gethostbyname(argv[1]);
    if (h == NULL)
    {
        printf("netspyd : unknown host '%s'\n", argv[1]);
        exit(1);
    }
    servAddr.sin_family = h->h_addrtype;
    memcpy((char *)&servAddr.sin_addr.s_addr,
           h->h_addr_list[0],
           h->h_length);
    servAddr.sin_port = htons(SERVER_PORT);
    if (!IN_MULTICAST(ntohl(servAddr.sin_addr.s_addr)))
    {
        printf("netspyd : address '%s' is not multicast\n",
               inet_ntoa(servAddr.sin_addr));
        exit(1);
    }
    sd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sd < 0)
    {
        printf("netspyd : cannot open socket\n");
        exit(1);
    }
    cliAddr.sin_family = AF_INET;
    cliAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    cliAddr.sin_port = htons(SERVER_PORT + 1);
    if (bind(sd, (struct sockaddr *)&cliAddr,
             sizeof(cliAddr)) < 0)
    {
        perror("bind");
        exit(1);
    }
    if (setsockopt(sd, IPPROTO_IP, IP_MULTICAST_TTL, &ttl,
                   sizeof(ttl)) < 0)
    {
        printf("netspyd : cannot set ttl = %d \n", ttl);
        exit(1);
    }
    printf("netspyd started : \n");
    printf("                [local address   : %s:%d]\n",
           hostn, SERVER_PORT + 1);
    printf("                [multicast group : %s:%d]\n\n",
           inet_ntoa(*(struct in_addr *)h->h_addr_list[0]),
           SERVER_PORT);
    char line[1024];
    while(scanf("%1024s", line) != EOF)
    {
        int line_len = strlen(line);
        sendto(sd, line, strlen(line) + 1, 0,
                           (struct sockaddr *)&servAddr, sizeof(servAddr));
        sleep(2);
    }
    close(sd);
    exit(0);
}