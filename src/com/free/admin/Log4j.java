package com.free.admin;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class Log4j {
    private Logger logger = Logger.getLogger(getClass());
    
    public static void main(String args[]) {
    	Log4j log = new Log4j();        
        BasicConfigurator.configure();
        log.logger.debug("This is a debug log entry");
        log.logger.info("This is an info log entry");
        log.logger.error("This is an error log entry");	
    }
}
