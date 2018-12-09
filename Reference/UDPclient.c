/////////////////////////////////////////////////////
// UDPclient.c -- Sockets that use UDP datagrams   //
//                                                 //
// Written by Dr Shiwen Mao, Polytechnic Univ.     //
// December 2003.                                  //
/////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#define BUFFLEN 100

int main(int argc, char *argv[])
{
    int sockclient;
    struct sockaddr_in server_addr;
    struct hostent *hent;
    int sendlen, rcvdlen, addrlen;
    char buf[BUFFLEN];
    if (argc != 4)
    {
        printf("Usage: UDPclient server_ip server_port message\n");
        exit(1);
    }
    // Get the UDP server's IP address
    if ((hent = gethostbyname(argv[1])) == NULL)
    {
        printf("Error in gethostbyname.\n");
        exit(1);
    }
    // Create the UDP client socket
    if ((sockclient = socket(AF_INET, SOCK_DGRAM, 0)) == -1)
    {
        printf("Error in creating UDP socket.\n");
        exit(1);
    }
    // Set the UDP server's address
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = atoi(argv[2]);
    server_addr.sin_addr = *((struct in_addr *)
                                 hent->h_addr);
    memset(&(server_addr.sin_zero), '\0', 8);
    // Send the message to the UDP server
    if ((sendlen = sendto(sockclient, argv[3], strlen(argv[3]), 0, (struct sockaddr *)&server_addr, sizeof(struct sockaddr))) == -1)
    {
        printf("Error in sendto.\n");
        exit(1);
    }
    printf("sent %d bytes to %s\n",
           sendlen, inet_ntoa(server_addr.sin_addr));
    printf("message: %s\n\n", argv[3]);
    // Receive the returned message from the server
    if ((rcvdlen = recvfrom(sockclient, buf, BUFFLEN - 1,
                            0,
                            (struct sockaddr *)&server_addr, &addrlen)) == -1)
    {
        printf("Error in recvfrom.\n");
        exit(1);
    }
    printf("received %d bytes from server %s\n",
           rcvdlen,
           inet_ntoa(server_addr.sin_addr));
    buf[rcvdlen] = '\0';
    printf("received message: %s\n", buf);
    // Shutdown the UDP client socket
    close(sockclient);
    return 0;
}