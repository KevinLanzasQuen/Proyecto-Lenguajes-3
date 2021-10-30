package sudokux;
package Vistas;
import Vistas.ventanaInicial;
import org.jpl7.Query;
import java.util.Map;
import org.jpl7.Term;
import java.util.*;

/**
 * Clase sudokuX la cual se encarga de presentar la ventana inicial del juego y traer la matriz solucion y la matriz de pistas de prolog
 * @author Jordi Segura ,Kevin Lanzas
 */
public class SudokuX {
    public static List<String[]> matrizDePistas = matrizPistas();
    public static List<String[]> matrizSolucion = matrizSudoku();
    
 /**
 * Metofo main el cual se encarga de cargar la ventana principal 
 * @author Jordi Segura, Kevin Lanzas
 */
    public static void main(String[] args) {
        ventanaInicial v1 = new ventanaInicial();
        v1.setLocationRelativeTo(null);
        v1.setVisible(true);
        System.out.print(matrizDePistas.get(0)[0]);
        for(int k = 0; k<9;k++){
            System.out.print("\n");
            for(int h = 0; h<2;h++){
                System.out.print(matrizDePistas.get(k)[h]);
            }
        }
        System.out.print(matrizSolucion.get(0)[0]);
        for(int k = 0; k<9;k++){
            System.out.print("\n");
            for(int h = 0; h<9;h++){
                System.out.print(matrizSolucion.get(k)[h]);
            }
        }
    }

 /**
 * Metodo matrizPistas el cual se encarga de traer la matriz de pistas de prolog
 * @author Jordi Segura, Kevin Lanzas
 */
    public static List<String[]> matrizPistas(){
        Query q = new Query("consult('test.pl')");
        q.hasSolution();
        q = new Query("matrizPistas(R)");
        Map<String, Term>[] res = q.allSolutions();
        System.out.println(res[0]);
        List<String[]> testList = new ArrayList<String[]>();
        String[] strArray = res[0].toString().split(",");
        for (int i = 0; i < strArray.length-1;i++) {
            String[] strArrTemp = new String[2];
            for(int j=0;j<2;j++){
                if ( j == 0){
                    if (i == 0){
                         strArrTemp[j] = String.valueOf(strArray[i].charAt(5));
                    }else{
                         strArrTemp[j] = String.valueOf(strArray[i].charAt(2));  
                    } 
                    i++;
                }else{
                    if (j==1){
                        strArrTemp[j] = String.valueOf(strArray[i].charAt(1));
                    }else{
                        strArrTemp[j] = String.valueOf(strArray[i].charAt(1));
                        i++;
                    }
                }
            }
            testList.add(strArrTemp);
        }
        return testList;
    }

/**
 * Metodo matrizSudoku el cual se encarga de traer la matriz de solucion de Prolog
 * @author Jordi Segura, Kevin Lanzas
 */    
    public static List<String[]> matrizSudoku(){
        String[] Opc = {"problem(1,R),sudoku(R),maplist(label,R),!.","problem1(1,R),sudoku(R),maplist(label,R),!.","problem2(2,R),sudoku(R),maplist(label,R),!.","problem3(1,R),sudoku(R),maplist(label,R),!.","problem4(1,R),sudoku(R),maplist(label,R),!.","problem5(5,R),sudoku(R),maplist(label,R),!.","problem6(6,R),sudoku(R),maplist(label,R),!.","problem7(7,R),sudoku(R),maplist(label,R),!.","problem8(8,R),sudoku(R),maplist(label,R),!.","problem9(9,R),sudoku(R),maplist(label,R),!.","problem10(10,R),sudoku(R),maplist(label,R),!.","problem11(11,R),sudoku(R),maplist(label,R),!.","problem12(12,R),sudoku(R),maplist(label,R),!.","problem13(13,R),sudoku(R),maplist(label,R),!."};
        Query q = new Query("consult('test.pl')");
        q.hasSolution();
        int valorDado = (int) Math.floor(Math.random()*13);
        q = new Query(Opc[valorDado]);
        Map<String, Term>[] res = q.allSolutions();
        List<String[]> testList = new ArrayList<String[]>();
        String[] strArray = res[0].toString().split(",");
        for (int i = 0; i < strArray.length-2;i++) {
            String[] strArrTemp = new String[9];
            for(int j=0;j<9;j++){
                if ( j == 0){
                    if (i == 0){
                         strArrTemp[j] = String.valueOf(strArray[i].charAt(5));
                    }else{
                         strArrTemp[j] = String.valueOf(strArray[i].charAt(2));  
                    } 
                    i++;
                }else{
                    if (j==8){
                        strArrTemp[j] = String.valueOf(strArray[i].charAt(1));
                    }else{
                        strArrTemp[j] = String.valueOf(strArray[i].charAt(1));
                        i++;
                    }
                }
            }
            testList.add(strArrTemp);
        }
        return testList;
    }
    
}

