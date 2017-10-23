package com.proximus.bootcamel.she.camelmiddleware.logging;

import java.util.Map;

import org.apache.camel.Body;
import org.apache.camel.Exchange;
import org.apache.camel.Handler;
import org.apache.camel.Headers;

public interface EndpointLogger {

	@Handler
	void logEvent(Exchange exchange,
			@Headers Map<String, Object> headers, @Body String body,
			String message, boolean logRequired);

}