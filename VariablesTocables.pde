/*Made BY JPUPPER */
/*Controles :
TECLADO:
d: Muestra el framerate
1: setea para controlar el sistema de particulas de palabras con el mouse
2: setea para controlar el repeler con el mouse
r: muestra y deja de mostrar el repeler.
OSC :
/psx de 0 a 1 mapea el X del sistema de particulas
/psy de 0 a 1 mapea el Y del sistema de particulas
/rx de 0 a 1 mapea el X del sistema de particulas
/ry de 0 a 1 mapea el Y del sistema de particulas*/

float AceleracionInicial = 0.01;
float Velocidad = 0.5; //Velocidad en la que se randomiza para las 4 direcciones.
float Vida = .05; //La vida que va restando (arranca en 255, termina en 0.
float FontSiz = 20; //Tamaño de la tipografia
float speedLimit = 0.7; //Limite de velocidad; 
float lifeToLetter = 225; //A partir de cuanta vida restante se desarma la palabra (255 max- 0 min)..
float Gduration = 1000; //Si se sube este numerito se spawnean menos particulas
boolean Modoletras = true;
