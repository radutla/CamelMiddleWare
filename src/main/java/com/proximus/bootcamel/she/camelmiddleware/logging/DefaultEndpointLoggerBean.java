/**
 *
 */
package com.proximus.bootcamel.she.camelmiddleware.logging;


import java.util.Map;

import org.apache.camel.Body;
import org.apache.camel.Exchange;
import org.apache.camel.Handler;
import org.apache.camel.Headers;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;


/**
 * @author Pranav Sharma id822450
 *
 */

@Component(value = "endpointLogger")
public class DefaultEndpointLoggerBean implements EndpointLogger {
	/**
	 * To get the Logger instance for log message.
	 */
	private static final Logger LOGGER = Logger.getLogger("com.proximus.SpringBootCamelIntegration");

	/* (non-Javadoc)
	 * @see com.proximus.p025.EnpointLogger#logEvent(org.apache.camel.Exchange, java.util.Map, java.lang.String, java.lang.String, boolean)
	 */
	@Override
	@Handler
	public void logEvent(Exchange exchange, @Headers Map<String, Object> headers, @Body String body, String message, boolean logRequired){

//		String routeId = exchange.getUnitOfWork().getRouteContext().getRoute().getId();
//		StringBuilder builder = new StringBuilder();

		Exception exception = (Exception) exchange.getProperty(Exchange.EXCEPTION_CAUGHT);
		if(exception != null){
			LOGGER.info("Exception occurred:::::"+ exception);
			body = ExceptionUtils.getStackTrace(exception);
		}

		LOGGER.info("\n"+message+"::\n"+body);
	}
}
