package com.proximus.bootcamel.she.camelmiddleware.exception.handler;

import java.util.Map;

import org.apache.camel.Exchange;
import org.apache.camel.Handler;
import org.apache.camel.Headers;
import org.apache.camel.processor.DefaultExchangeFormatter;
import org.apache.camel.util.MessageHelper;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;


/**
 * Used to throw application exception.
 *
 */
@Component(value="defaultExceptionHandler")
public class DefaultExceptionHandler implements IExceptionHandler {
	/**
	 * To get the Logger instance for log message.
	 */
	private static final Logger AUDITLOGGER = Logger.getLogger("com.proximus.SpringBootCamelIntegration");



	/* (non-Javadoc)
	 * @see IExceptionHandler#process(org.apache.camel.Exchange, java.util.Map)
	 */
	@Override
	@Handler
	public void process(Exchange exchange, @Headers Map<String, Object> headers)
			throws Exception {
		AUDITLOGGER.info("ExceptionHandler::process()::enters");

		Exception exception = (Exception) exchange
				.getProperty(Exchange.EXCEPTION_CAUGHT);

		String auditInfo = MessageHelper.dumpMessageHistoryStacktrace(exchange,
				new DefaultExchangeFormatter(), true);
		StringBuilder builder = new StringBuilder();

		builder.append("\nAudit log for message where:");
		builder.append("\n----------------------------------------------------------------------");
		builder.append("\nSoap Action::" + headers.get("SOAPAction"));
		builder.append("\nCorrelation ID::" + headers.get("correlationId"));
		builder.append("\n" + auditInfo);
		builder.append("\n" + headers.get("SpringBootCamelIntegrationStackTrace"));
		AUDITLOGGER.info(builder.toString());


		if (exception instanceof Exception) {
			generateTechnicalFault(exchange, headers, exception);
		} else {
			setRunTimeExceptionMessageInHeader(exchange,exception,headers);
		}

		AUDITLOGGER.info("AuditLog::ExceptionHandler::exits");

	}

	private void setRunTimeExceptionMessageInHeader(Exchange exchange,Exception exception,Map<String, Object> headers) {
		exchange.getIn().setHeader("SpringBootCamelIntegrationExceptionCode", exception.getClass().getCanonicalName());
		exchange.getIn().setHeader("SpringBootCamelIntegrationExceptionDescription",exception.getMessage());
	}


	private void generateTechnicalFault(Exchange exchange, Map<String, Object> headers, Exception exception) throws Exception {

        exchange.getIn().setHeader("SpringBootCamelIntegrationExceptionCode", exception.getMessage());
        exchange.getIn().setHeader("SpringBootCamelIntegrationExceptionDescription",exception.getMessage());

	}
}
