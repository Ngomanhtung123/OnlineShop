/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author SANG
 */
public class NewClass {

    public static void main(String[] args) {
        String filePath = "input.txt";
        NewClass s = new NewClass();
            String fileContent =  s.readTextFile();
            System.out.println(fileContent);
    }

    public String readTextFile() {
        String filePath = "input.txt";
        String content = "";
        BufferedReader reader = null;

        try {
            reader = new BufferedReader(new FileReader(filePath));
            String line;
            while ((line = reader.readLine()) != null) {
                content+=line+"\n";
            }
        }catch(Exception ex){
        
        } finally {
        }

        return content;
    }
}
