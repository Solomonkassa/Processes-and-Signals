#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <signal.h>
#include <errno.h>


int main ()
{
  pid_t pid = fork();

  if (pid == -1)
  {
    perror(" ");
  }
  else if(pid == 0)
  {
  while(1)
    {
      printf("Until you kill this process %d\n",pid);
      usleep(50000);
    }
  }
  else
    {
      sleep(1);
      kill(pid,SIGKILL);
      wait(NULL);
    }
  return 0;
}
