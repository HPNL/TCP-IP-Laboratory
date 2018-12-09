/////////////////////////////////////////////////////
// TCPclient.c -- A TCP client socket              //
//                                                 //
// Written by Dr Shiwen Mao, Polytechnic Univ.     //
// December 2003.                                  //
/////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>

#define BUFFLEN 100

int main(int argc, char *argv[])
{
    int sockserver;
    struct hostent *hent;
    struct sockaddr_in server_addr;
    int sendlen, rcvdlen;
    char buf[BUFFLEN];
    if (argc != 4)
    {
        printf("Usage: TCPclient server_ip server_port message\n");
        exit(1);
    }
    // Get the TCP server's IP address
    if ((hent = gethostbyname(argv[1])) == NULL)
    {
        printf("Error in gethostbyname.\n");
        exit(1);
    }
    // Create the TCP client socket
    if ((sockserver = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        printf("Error in creating the socket.\n");
        exit(1);
    }
    // Set the server socket address
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = atoi(argv[2]);
    server_addr.sin_addr = *((struct in_addr *)
                                 hent->h_addr);
    memset(&(server_addr.sin_zero), '\0', 8);
    // Connect to the above server socket
    if (connect(sockserver, (struct sockaddr *)&server_addr,
                sizeof(struct sockaddr)) == -1)
    {
        printf("Error in connect.\n");
        exit(1);
    }
    // Send a message to the TCP server
    if ((sendlen = send(sockserver, argv[3],
                        strlen(argv[3]), 0)) == -1)
    {
        printf("Error in send.\n");
        exit(1);
    }
    printf("Sent to server: %s\n", argv[3]);
    // Receive the returned message from the server
    if ((rcvdlen = recv(sockserver, buf, BUFFLEN - 1, 0)) == -1)
    {
        printf("Error in recv.\n");
        exit(1);
    }
    buf[rcvdlen] = '\0';
    printf("Received from server: %s\n", buf);
    // Close the TCP client socket
    close(sockserver);
    return 0;
}