package com.proximus.bootcamel.she.camelmiddleware.exception.handler;

import java.util.Map;

import org.apache.camel.Exchange;

public interface IExceptionHandler {

	/**
     * To Catch the exception triggered while routing
     *
     * @param exchange
     */

     void process(Exchange exchange, Map<String, Object> headers)
	    throws Exception;

}
