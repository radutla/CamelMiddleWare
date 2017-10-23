package com.proximus.bootcamel.she.camelmiddleware.logging;

import org.apache.camel.Exchange;
import org.apache.camel.Handler;
import org.apache.camel.Headers;
import org.apache.camel.processor.DefaultExchangeFormatter;
import org.apache.camel.util.MessageHelper;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import java.util.Map;

@Component(value = "logAudit")
public class AuditLog {
	/**
	 * To get the Logger instance for log message.
	 */

	private static final Logger LOGGER = Logger.getLogger("org.camel.audit");

	/**
	 * Log the request .
	 *
	 * @param exchange
	 *
	 */

	@Handler
	public void process(Exchange exchange, @Headers Map<String, Object> headers) throws Exception {
		LOGGER.info("AuditLog::process()::enters");
		String auditInfo = MessageHelper.dumpMessageHistoryStacktrace(exchange, new DefaultExchangeFormatter(), true);
		StringBuilder builder = new StringBuilder();
		builder.append("\nAudit log for message where:");
		builder.append("\n----------------------------------------------------------------------");
		builder.append("\nSoap Action::"+headers.get("SOAPAction"));
		builder.append("\nCorrelation ID::"+headers.get("correlationId"));
		builder.append("\n"+auditInfo);
		LOGGER.info(builder.toString());

		LOGGER.info("AuditLog::process()::exits");
	}
}