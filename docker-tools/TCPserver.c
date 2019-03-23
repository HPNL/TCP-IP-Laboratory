/////////////////////////////////////////////////////
// TCPserver.c -- A TCP server socket              //
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

#define BACKLOG 10
#define BUFFLEN 100

int main(int argc, char *argv[])
{
    int sockserver, sockclient;
    struct sockaddr_in server_addr, client_addr;
    int sockin_size;
    int sendlen, rcvdlen;
    char buf[BUFFLEN];
    if (argc != 2)
    {
        printf("Usage: TCPserver server_port\n");
        exit(1);
    }
    // Create the TCP server socket
    if ((sockserver = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    {
        printf("Error in creating the server socket.\n");
        exit(1);
    }
    // Set the server socket address
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = atoi(argv[1]);
    server_addr.sin_addr.s_addr = INADDR_ANY;
    memset(&(server_addr.sin_zero), '\0', 8);
    // Associate the server address with the server socket
    if (bind(sockserver, (struct sockaddr *)&server_addr,
             sizeof(struct sockaddr)) == -1)
    {
        printf("Error in bind.\n");
        exit(1);
    }
    // Waiting for client requests
    if (listen(sockserver, BACKLOG) == -1)
    {
        printf("Error in listen.\n");
        exit(1);
    }
    while (1)
    {
        // Accept a client connection request
        sockin_size = sizeof(struct sockaddr_in);
        if ((sockclient = accept(sockserver,
                                 (struct sockaddr *)&client_addr,
                                 &sockin_size)) == -1)
        {
            printf("Error in accept.\n");
            continue;
        }
        printf("TCP server: connection request from %s\n ", inet_ntoa
               (client_addr.sin_addr));
        // Receive a message from the connected client
        if ((rcvdlen = recv(sockclient, buf, BUFFLEN - 1, 0)) == -1)
        {
            printf("Error in recv.\n");
            continue;
        }
        buf[rcvdlen] = '\0';
        printf("Received from client: %s\n", buf);
        // Return the message to the client
        if ((sendlen = send(sockclient, buf, rcvdlen, 0)) == -1)
        {
            printf("Error in send.\n");
            continue;
        }
        printf("Sent to client: %s\n\n", buf);
        // Close the client socket, terminate the TCP connection.
        close(sockclient);
    }
    return 0;
}