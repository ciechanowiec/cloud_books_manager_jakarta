package com.resetter;

import java.sql.SQLException;
import java.util.TimerTask;

import com.logic.DataManager;

public class ResetTask extends TimerTask {

    private DataManager dataManager;
    
    public ResetTask() {        
        this.dataManager = new DataManager("jdbc:mysql://34.118.32.232/bookstore", "booksmanager", "MiN_672#grost");        
    }

    @Override
    public void run() {        
        try {
            this.dataManager.clearData();
            this.dataManager.insertDefaultData();
        } catch (SQLException e) {            
            e.printStackTrace();
        }                
    }

}