/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat;

import java.sql.Statement;


/**
 *
 * @author rithish r
 */
public class Cat {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       database db = new database();
        db.openConnection();
       
        Main m =new Main(db);
     
    }
    
}
