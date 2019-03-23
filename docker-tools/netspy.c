/******************************************/
/* netspy.c                              */
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
#include <stdlib.h>
#include <string.h>
#include <unistd.h> /* close */

#define MAX_MSG 100

void main(int argc, char *argv[])
{
    int sd, rc, n, cliLen;
    struct ip_mreq mreq;
    struct sockaddr_in cliAddr, servAddr;
    struct in_addr mcastAddr;
    struct hostent *h;
    char msg[MAX_MSG];
    int SERVER_PORT;
    if (argc != 3)
    {
        printf("usage : %s <mcast address> <mcast port number>\n", argv[0]);
        exit(0);
    }
    SERVER_PORT = atoi(argv[2]);
    /* get mcast address to listen to */
    h = gethostbyname(argv[1]);
    if (h == NULL)
    {
        printf("%s : unknown group '%s'\n", argv[0], argv[1]);
        exit(1);
    }
    memcpy(&mcastAddr, h->h_addr_list[0], h->h_length);
    /* check given address is multicast */
    if (!IN_MULTICAST(ntohl(mcastAddr.s_addr)))
    {
        printf("%s : given address '%s' is not multicast\n",
               argv[0],
               inet_ntoa(mcastAddr));
        exit(1);
    }
    /* create socket */
    sd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sd < 0)
    {
        printf("%s : cannot create socket\n", argv[0]);
        exit(1);
    }
    /* bind port */
    servAddr.sin_family = AF_INET;
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servAddr.sin_port = htons(SERVER_PORT);
    if (bind(sd, (struct sockaddr *)&servAddr,
             sizeof(servAddr)) < 0)
    {
        printf("%s : cannot bind port %d \n", argv[0],
               SERVER_PORT);
        exit(1);
    }
    /* join multicast group */
    mreq.imr_multiaddr.s_addr = mcastAddr.s_addr;
    mreq.imr_interface.s_addr = htonl(INADDR_ANY);
    rc = setsockopt(sd, IPPROTO_IP, IP_ADD_MEMBERSHIP,
                    (void *)&mreq,
                    sizeof(mreq));
    if (rc < 0)
    {
        printf("Netspy : cannot join multicast group '%s'", inet_ntoa(mcastAddr));
        exit(1);
    }
    else
    {
        printf("\nNetspy : listening to mgroup %s:%d\n\n",
               inet_ntoa(mcastAddr),
               SERVER_PORT);
        /* infinite server loop */
        while (1)
        {
            cliLen = sizeof(cliAddr);
            n = recvfrom(sd, msg, MAX_MSG, 0,
                         (struct sockaddr *)&cliAddr,
                         &cliLen);
            if (n < 0)
            {
                printf("Netspy : cannot receive data\n");
                continue;
            }
            printf("    == : %s\n", msg);
        } /* end of infinite server loop */
    }
}