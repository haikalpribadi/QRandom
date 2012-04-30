/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.idquantique.quantis;

import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

/**
 *
 * @author haikalpribadi
 */
public class Resource {

    public static Resource instance = null;
    private static final int MAXPOOL = 50;
    private static AtomicInteger currentPool;
    private static Semaphore ticket = new Semaphore(MAXPOOL,true);
    private Resource(){
        currentPool = new AtomicInteger(0);
    }
    public static Resource getInstance(){
        if(instance==null){
            instance = new Resource();
        }
        return instance;
    }

    public synchronized boolean acquire(){
        if(currentPool.get()<MAXPOOL){
            try{
                ticket.acquire();
                currentPool.incrementAndGet();
                return true;
            } catch(Exception e){
                return false;
            }
        }
        else{
            return false;
        }
    }

    public synchronized void release(){
        ticket.release();
        if(currentPool.get()>0){
            currentPool.decrementAndGet();
        }
    }
}
