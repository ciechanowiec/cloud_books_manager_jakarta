package com.resetter;

import java.util.Timer;
import java.util.concurrent.TimeUnit;

/* This class is used to reset the database and insert 
   into it a default set of entries once a day */

public class Resetter {

    private Timer timer;

    public Resetter() {
        this.timer = new Timer();
        ResetTask resetTask = new ResetTask();
        try {
            timer.schedule(resetTask, 10000, TimeUnit.DAYS.toMillis(1));        
        } catch (Exception e) {
            e.printStackTrace();
            this.timer.cancel();
        }
    }

    public static void main(String[] args) {
        new Resetter();
    }
    
}