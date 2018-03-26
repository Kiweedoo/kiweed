#include <stdio.h>
/*
 * les fonctions publiques aux autres modules (les .c)
 */
#include "public_fct.h"

int main(void);

/* privée à ce module == n'est pas accessible en dehors de fichier.c */
static void saluer(void);

int main(void)
{
	static char *partie_1, *partie_2;

	partie_1 = (char *) premiere_partie();
	partie_2 = (char *) seconde_partie();
	printf("%s %s\n", partie_1, partie_2);

	return(0);
}
