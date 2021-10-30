/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sudokux;
import javax.swing.JLabel;

/**
 * Clase Cronometro el cual se encarga de generar un cronometro en el juego
 * @author Jordi Segura, Kevin Lanzas
 * @extends Thread
 */
public class Cronometro extends Thread { //una clase que hereda de la clase Thread
    JLabel p;
    public String time;
    
 /**
 * Metodo constructor de la clase constructor el caul se encarga de construir los elementos necesarios para iniciar el cronometro
 * @author Jordi Segura, Kevin Lanzas
 * @extends Thread
 * @param Jlabel
 */
    public Cronometro(JLabel pLabel){// Contructor porque la clase es heredada 
        super();
        p = pLabel;
    }
    
 /**
 * Metodo run el cual se encarga de iniciar el cronometro
 * @author Jordi Segura, Kevin Lanzas
 */
    public void run() {
        int nuMin=0; //El Contador de minutos
        int nuSeg=0; //El Contador de de segundos
        int nuHora=0; //El Contador de Horas
            try {//si ocurre un error al dormir el proceso(sleep(999))
                for (; ;){ //inicio del for infinito
                   if(nuSeg!=59) {//si no es el ultimo segundo
                       nuSeg++; //incremento el numero de segundos
                    }else{
                        if(nuMin!=59){//si no es el ultimo minuto
                            nuSeg=0;//pongo en cero los segundos 
                            nuMin++;//incremento el numero de minutos
                        }else{//incremento el numero de horas
                                nuHora++;
                                nuMin=0;//pongo en cero los minutos
                                nuSeg=0;//pongo en cero los segundos
                        }
                    }
                    p.setText("Tiempo Jugado: " + nuHora + ":"  + nuMin + ":" + nuSeg + "s");
                    time =  nuHora + ":"  + nuMin + ":" + nuSeg + "s";
                    sleep(999);//Duermo el hilo durante 999 milisegundos(casi un segundo, quintandole el tiempo de proceso)
                }//Fin del for infinito
            } catch (Exception ex) {
                 System.out.println(ex.getMessage());//Imprima el error
            }
   }
}