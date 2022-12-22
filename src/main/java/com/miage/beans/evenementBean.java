/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.miage.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author ADMIN
 */
public class evenementBean {
    private String nom;
    private Date dateDebut;
    private Date dateFin;
    private Time heureDebut;
    private Time heureFin;
    private String lieu;
    private String categorie;
    private int priorite;
    private String participants;
    private String commentaires;
    
    /**
     * Getter et setter de nom
     */
    public String getNom(){
        return nom;
    }
    public void setNom(String nom){
        this.nom = nom;
    }
    
    /**
     * Getter et setter de dateDebut
     */
    public Date getDateDebut(){
        return dateDebut;
    }
    public void setDateDebut(Date dateDebut){
        this.dateDebut = dateDebut;
    }
    
    /**
     * Getter et setter de dateFin
     */
    public Date getDateFin(){
        return dateFin;
    }
    public void setDateFin(Date dateFin){
        this.dateFin = dateFin;
    }
    
    /**
     * Getter et setter de heureDebut
     */
    public Time getHeureDebut(){
        return heureDebut;
    }
    public void setHeureDebut(Time heureDebut){
        this.heureDebut = heureDebut;
    }
    
    /**
     * Getter et setter de heureFin
     */
    public Time getHeureFin(){
        return heureFin;
    }
    public void setHeureFin(Time heureFin){
        this.heureFin = heureFin;
    }
    
    /**
     * Getter et setter de lieu
     */
    public String getLieu(){
        return lieu;
    }
    public void setLieu(String lieu){
        this.lieu = lieu;
    }
    
    /**
     * Getter et setter de categorie
     */
    public String getCategorie(){
        return categorie;
    }
    public void setCategorie(String categorie){
        this.categorie = categorie;
    }
    
    /**
     * Getter et setter de priorite
     */
    public int getPriorite(){
        return priorite;
    }
    public void setPriorite(int priorite){
        this.priorite = priorite;
    }                                                                                                                                                                                                                                                                                                                     
    
    /**
     * Getter et setter de participants
     */
    public String getParticipants(){
        return participants;
    }
    public void setParticipants(String participants){
        this.participants = participants;
    }
    
    /**
     * Getter et setter de commentaires
     */
    public String getCommentaires(){
        return commentaires;
    }
    public void setCommentaires(String commentaires){
        this.commentaires = commentaires;
    }
    
    public static Connection connecterBD(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bd_agenda";
            Connection connecter = DriverManager.getConnection(url, "root", "root");
            System.out.println("Connection établie avec succès");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public void ajouter(){
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bd_agenda";
        Connection connecter = DriverManager.getConnection(url, "root", "root");
        Statement stmt = connecter.createStatement();
        ResultSet rs = stmt.executeQuery("Select * FROM evenement;");
        while(rs.next()){
            System.out.println(rs.getString(1));
            System.out.println(rs.getDate(2));
            System.out.println(rs.getDate(3));
            System.out.println(rs.getTime(4));
            System.out.println(rs.getTime(5));
            System.out.println(rs.getString(6));
            System.out.println(rs.getString(7));
            System.out.println(rs.getString(8));
            System.out.println(rs.getString(9));
            System.out.println(rs.getInt(10));
        }
        rs.close();
    }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws SQLException, ParseException{
        String p1 = "Rendez_u";
        Connection connecter = null;
        String requete = "Select * From evenement;";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/agenda";
            connecter = DriverManager.getConnection(url, "root", "root");
            Statement stmt = connecter.createStatement();
            ResultSet rs = stmt.executeQuery(requete);
            
            while(rs.next()){
                if (rs.getString(11).equals(p1)){
                    System.out.println("Evènement trouvé avec succès");
                }
                else{
                    System.out.println("Evènement introuvable");
                }
            }
            rs.close();
            connecter.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
