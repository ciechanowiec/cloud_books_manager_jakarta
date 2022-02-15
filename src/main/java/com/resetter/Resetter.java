package com.resetter;

import java.util.Timer;
import java.util.concurrent.TimeUnit;

/* This class is used to reset the database and insert 
   into it a default set of entries every three days */

public class Resetter {

    private Timer timer;

    public Resetter() {
        this.timer = new Timer();
        ResetTask resetTask = new ResetTask();
        try {
            timer.schedule(resetTask, 10000, TimeUnit.DAYS.toMillis(3));        
        } catch (Exception e) {
            e.printStackTrace();
            this.timer.cancel();
        }
    }

    public static void main(String[] args) {
        new Resetter();
    }
    
}