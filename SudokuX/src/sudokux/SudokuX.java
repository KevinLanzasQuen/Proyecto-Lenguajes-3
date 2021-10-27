package sudokux;
package Vistas;
import Vistas.ventanaInicial;
import org.jpl7.Query;
import java.util.Map;
import org.jpl7.Term;
import java.util.*;

/**
 *
 * @author Kevin y Jordi
 */
public class SudokuX {

    public static void main(String[] args) {
        ventanaInicial v1 = new ventanaInicial();
        v1.setLocationRelativeTo(null);
        v1.setVisible(true);
    }

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
    
    public static List<String[]> matrizSudoku(){
        String[] Opc = {"problem(1,R),sudoku(R),maplist(label,R),!.","problem1(1,R),sudoku(R),maplist(label,R),!.","problem2(2,R),sudoku(R),maplist(label,R),!.","problem3(1,R),sudoku(R),maplist(label,R),!.","problem4(1,R),sudoku(R),maplist(label,R),!.","problem5(5,R),sudoku(R),maplist(label,R),!.","problem6(6,R),sudoku(R),maplist(label,R),!.","problem7(7,R),sudoku(R),maplist(label,R),!."};
        Query q = new Query("consult('test.pl')");
        q.hasSolution();
        int valorDado = (int) Math.floor(Math.random()*8);
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

