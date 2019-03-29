/////////////////////////////////////////////////////
// UDPserver.c -- Sockets that use UDP datagrams   //
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

#define BUFFLEN 100

int main(int argc, char *argv[])
{
    int sockserver;
    struct sockaddr_in server_addr;
    struct sockaddr_in client_addr;
    int addr_len, sendlen, rcvdlen;
    char buf[BUFFLEN];
    if (argc != 2)
    {
        printf("Usage: UDPserver server_port \n");
        exit(1);
    }

    // Create the UDP server socket
    if ((sockserver = socket(AF_INET, SOCK_DGRAM,
                             0)) == -1)
    {
        printf("Error in creating UDP socket.\n");
        exit(1);
    }
    // Set the server socket address
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = atoi(argv[1]);
    server_addr.sin_addr.s_addr = INADDR_ANY;
    memset(&(server_addr.sin_zero), '\0', 8);
    // Associate the server socket address with the server socket 
    if (bind(sockserver, (struct sockaddr *)&server_addr,
                           sizeof(struct sockaddr)) == -1)
    {
        printf("Error in binding the socket address.\n");
        exit(1);
    }
    while (1)
    {
        // Receive a message from the UDP client socket
        addr_len = sizeof(struct sockaddr);
        if ((rcvdlen = recvfrom(sockserver, buf, BUFFLEN - 1,
                                0,
                                (struct sockaddr *)&client_addr, &addr_len)) == -1)
        {
            printf("Error in recvfrom.\n");
            exit(1);
        }
        printf("got a %i byte packet from client %s\n",
               rcvdlen, inet_ntoa(client_addr.sin_addr));
        buf[rcvdlen] = '\0';
        printf("message: %s\n", buf);
        // Return the message to the client
        if ((sendlen = sendto(sockserver, buf, rcvdlen, 0,
                              (struct sockaddr *)&client_addr,
                              sizeof(struct sockaddr))) == -1)
        {
            printf("Error in sendto.\n");
            exit(1);
        }
        printf("returned %d bytes to client %s\n",
               sendlen,
               inet_ntoa(client_addr.sin_addr));
        printf("message: %s\n\n", buf);
    }
    return 0;
}