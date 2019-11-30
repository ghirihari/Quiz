package cat;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main extends Canvas {
    @Override
    public void paint(Graphics g){
        Toolkit t=Toolkit.getDefaultToolkit();
        Image i=t.getImage("logo.gif");
        g.drawImage(i, 0,0,this);
    }
    Main(database db){
        String[] columnNames = { "Name", "Car number", "Team","Nation","Points" };
        String [][] data=new String[3][5];
        String[] columnNames1 = { "Name", "country","Points" };
        String [][] data1=new String[3][3];
        JFrame f=new JFrame("Home");
        
        JTextArea ta=new JTextArea("Listing");

        JLabel l1=new JLabel("There are 7 billion people on this planet but only 20 formula one drivers.");
        l1.setBounds(150,120,500,70);

        JLabel l2=new JLabel(new ImageIcon("C:\\Users\\rithish r\\Desktop\\cat\\index.png"));
        l2.setBounds(30,30,700,100);

        f.setVisible(true);
        JButton b1=new JButton("Driver Standings");
        b1.setBounds(100,200,150,30);
              

        JButton b2=new JButton("Insert into schedule");
        b2.setBounds(280,200,200,30);
        b2.addActionListener((ActionEvent e) -> {
         
            
            try {
                db.schedule();
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
            ;
        });  
       
        JButton b3=new JButton("Schedule");
        b3.setBounds(520,200,100,30);

        JButton b4=new JButton("Simulate Race");
        b4.setBounds(280,260,200,30);


        f.setSize(750,750);
        f.setVisible(true);
        f.setLayout(null);
        f.add(b1);f.add(b2);f.add(b3);f.add(l1);f.add(l2);f.add(b4);
        b1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    db.driverwins(columnNames,data);
                    
                } catch (SQLException ex) {
                    Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                }
                JTable j;
                
                    j = new JTable(data, columnNames);
                    j.setBounds(100,400, 500, 100);
            f.add(j);        
            System.out.println("Table displayed");
            f.setVisible(true);
            }
        });  
       

    }

    public static void main(String[] args) {
        
    }
}
