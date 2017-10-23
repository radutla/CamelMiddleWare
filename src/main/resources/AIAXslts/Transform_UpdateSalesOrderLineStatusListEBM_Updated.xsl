<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns8="urn:v2.product.beim.objects.bgc"
                xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions"
                xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:tns="urn:v6.orderprogress.mcom.events.bgc"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:ns="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:ns6="urn:v2.commonprimary.beim.objects.bgc"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns4="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:ns0="http://xmlns.oracle.com/EnterpriseServices/SalesOrder/V2"
                xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns3="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04"
                xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:ns7="urn:v2.commonsecondary.beim.objects.bgc"
                xmlns:salesorderebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2"
                xmlns:coresalesorderebs="http://xmlns.oracle.com/EnterpriseServices/Core/SalesOrder/V2"
                xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1"
                xmlns:ns5="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/SalesOrder/V2"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:ns1="http://schemas.xmlsoap.org/ws/2003/03/addressing"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:req1="urn:v6.orderprogress.mcom.objects.bgc"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns2="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04"
                xmlns:ns9="urn:v2.resource.beim.objects.bgc"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                exclude-result-prefixes="xsl xs tns req1 ns8 ns ns6 ns4 ns0 ns3 corecom ns7 salesorderebo coresalesorderebs svcdoc ns5 ns1 soap ns2 ns9 ehdr aia xp20 ora orcl bpws hwf xref ids"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
   <xsl:template match="/">
      <salesorderebo:UpdateSalesOrderLineStatusListEBM>
         <corecom:EBMHeader>
            <corecom:EBMID>
               <xsl:value-of select="'oraext:generate-guid()'"/>
            </corecom:EBMID>
         </corecom:EBMHeader>
         <salesorderebo:DataArea>
            <salesorderebo:UpdateSalesOrderLineStatusList>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:subject) > 0">
                  <salesorderebo:TypeCode>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:subject"/>
                  </salesorderebo:TypeCode>
               </xsl:if>
               <corecom:Identification>
                  <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:identifier">
                     <xsl:if test="req1:idContext/req1:value != 'MCOM'">
                        <corecom:BusinessComponentID>
                           <xsl:value-of select="req1:id"/>
                        </corecom:BusinessComponentID>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:role/req1:partyRole/req1:customer/req1:identifier/req1:id) > 0">
                     <corecom:ID>
                        <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:role/req1:partyRole/req1:customer/req1:identifier/req1:id"/>
                     </corecom:ID>
                  </xsl:if>
                  <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:identifier">
                     <xsl:if test="req1:idContext/req1:value = 'MCOM'">
                        <corecom:ContextID>
                           <xsl:value-of select="req1:id"/>
                        </corecom:ContextID>
                     </xsl:if>
                  </xsl:for-each>
                  <corecom:ApplicationObjectKey>
                     <corecom:ID>
                        <xsl:text disable-output-escaping="no">''</xsl:text>
                     </corecom:ID>
                    <!-- <xsl:if test="dvm:lookupValue('oramds:/apps/AIAMetaData/dvm/bgcdvm/NOTIFICATION_SUBJECT.dvm','MCOM_Notification',tns:EventDataOrderProgress/tns:notification/req1:subject,'SHE_Notification','INVALID VALUE') != 'INVALID VALUE'">
                        <corecom:ContextID>
                           <xsl:text disable-output-escaping="no">Y</xsl:text>
                        </corecom:ContextID>
                     </xsl:if>-->
                    <!-- <xsl:if test="dvm:lookupValue('oramds:/apps/AIAMetaData/dvm/bgcdvm/NOTIFICATION_SUBJECT.dvm','MCOM_Notification',tns:EventDataOrderProgress/tns:notification/req1:subject,'SHE_Notification','INVALID VALUE') = 'INVALID VALUE'"> 
                        <corecom:ContextID>
                           <xsl:text disable-output-escaping="no">N</xsl:text>
                        </corecom:ContextID>
                     </xsl:if> -->
                  </corecom:ApplicationObjectKey>
                  <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:role/req1:partyRole/req1:salesPerson/req1:externalSalesPerson/req1:identifier/req1:id) > 0">
                     <corecom:AlternateObjectKey>
                        <corecom:ContextID>
                           <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:role/req1:partyRole/req1:salesPerson/req1:externalSalesPerson/req1:identifier/req1:id"/>
                        </corecom:ContextID>
                     </corecom:AlternateObjectKey>
                  </xsl:if>
                  <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:version) > 0">
                     <corecom:Revision>
                        <corecom:Number>
                           <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:version"/>
                        </corecom:Number>
                     </corecom:Revision>
                  </xsl:if>
               </corecom:Identification>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:operationalContext/req1:orderContext/req1:value) > 0">
                  <salesorderebo:SubstitutionAllowedIndicator>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:operationalContext/req1:orderContext/req1:value"/>
                  </salesorderebo:SubstitutionAllowedIndicator>
               </xsl:if>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:operationalContext/req1:actionReason/req1:value) > 0">
                  <salesorderebo:Description>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:operationalContext/req1:actionReason/req1:value"/>
                  </salesorderebo:Description>
               </xsl:if>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:requestedCeaseDate) > 0">
                  <salesorderebo:EarliestShipDateTime>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:requestedCeaseDate"/>
                  </salesorderebo:EarliestShipDateTime>
               </xsl:if>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:interactionDuration/req1:startTimeStamp) > 0">
                  <salesorderebo:OrderDateTime>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:interactionDuration/req1:startTimeStamp"/>
                  </salesorderebo:OrderDateTime>
               </xsl:if>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:dueDate) > 0">
                  <salesorderebo:PromisedDeliveryDateTime>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:dueDate"/>
                  </salesorderebo:PromisedDeliveryDateTime>
               </xsl:if>
               <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:salesChannel/req1:identifier/req1:id) > 0">
                  <salesorderebo:SalesChannelCode>
                     <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:salesChannel/req1:identifier/req1:id"/>
                  </salesorderebo:SalesChannelCode>
               </xsl:if>
               <corecom:Note>
                  <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:charVal">
                     <corecom:Status>
                        <corecom:Code>
                           <xsl:value-of select="req1:name"/>
                        </corecom:Code>
                        <corecom:SubStatusCode>
                           <xsl:value-of select="req1:value"/>
                        </corecom:SubStatusCode>
                     </corecom:Status>
                  </xsl:for-each>
               </corecom:Note>
               <corecom:Status>
                  <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:status/req1:value) > 0">
                     <corecom:Code>
                        <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:status/req1:value"/>
                     </corecom:Code>
                  </xsl:if>
                  <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:fulfillmentStatus/req1:value) > 0">
                     <corecom:SubStatusCode>
                        <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:fulfillmentStatus/req1:value"/>
                     </corecom:SubStatusCode>
                  </xsl:if>
               </corecom:Status>
               <corecom:OwnerPartyReference>
                  <corecom:PartyIdentification>
                     <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:comment">
                        <xsl:if test="req1:type/req1:value = 'Detailed Remark'">
                           <corecom:ID>
                              <xsl:value-of select="req1:comment"/>
                           </corecom:ID>
                           <corecom:ContextID>
                              <xsl:value-of select="req1:type/req1:value"/>
                           </corecom:ContextID>
                        </xsl:if>
                     </xsl:for-each>
                  </corecom:PartyIdentification>
               </corecom:OwnerPartyReference>
               <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:item">
                  <salesorderebo:SalesOrderLine>
                     <xsl:if test="count(req1:identifier/req1:id) > 0">
                        <corecom:Identification>
                           <corecom:ID>
                              <xsl:value-of select="req1:identifier/req1:id"/>
                           </corecom:ID>
                        </corecom:Identification>
                     </xsl:if>
                     <xsl:if test="count(req1:comment/req1:comment) > 0">
                        <salesorderebo:Description>
                           <xsl:value-of select="req1:comment/req1:comment"/>
                        </salesorderebo:Description>
                     </xsl:if>
                     <xsl:if test="count(req1:statusReason/req1:value) > 0">
                        <salesorderebo:ReasonCode>
                           <xsl:value-of select="req1:statusReason/req1:value"/>
                        </salesorderebo:ReasonCode>
                     </xsl:if>
                     <xsl:if test="count(req1:assignedProduct/req1:type/req1:value) > 0">
                        <salesorderebo:TypeCode>
                           <xsl:value-of select="req1:assignedProduct/req1:type/req1:value"/>
                        </salesorderebo:TypeCode>
                     </xsl:if>
                     <corecom:Note>
                        <xsl:for-each select="req1:charVal">
                           <corecom:Status>
                              <corecom:Code>
                                 <xsl:value-of select="req1:name"/>
                              </corecom:Code>
                              <corecom:SubStatusCode>
                                 <xsl:value-of select="req1:value"/>
                              </corecom:SubStatusCode>
                           </corecom:Status>
                        </xsl:for-each>
                     </corecom:Note>
                     <xsl:if test="count(req1:status/req1:value) > 0">
                        <corecom:Status>
                           <corecom:Code>
                              <xsl:value-of select="req1:status/req1:value"/>
                           </corecom:Code>
                        </corecom:Status>
                     </xsl:if>
                     <xsl:if test="count(req1:assignedProduct/req1:installationDate) > 0">
                        <corecom:EffectiveTimePeriod>
                           <corecom:StartDateTime>
                              <xsl:value-of select="req1:assignedProduct/req1:installationDate"/>
                           </corecom:StartDateTime>
                        </corecom:EffectiveTimePeriod>
                     </xsl:if>
                     <corecom:ItemReference>
                        <corecom:ItemIdentification>
                           <xsl:if test="count(req1:assignedProduct/req1:serviceIdentifier/req1:id) > 0">
                              <corecom:BusinessComponentID>
                                 <xsl:value-of select="req1:assignedProduct/req1:serviceIdentifier/req1:id"/>
                              </corecom:BusinessComponentID>
                           </xsl:if>
                           <xsl:if test="count(req1:assignedProduct/req1:identifier/req1:id) > 0">
                              <corecom:ID>
                                 <xsl:value-of select="req1:assignedProduct/req1:identifier/req1:id"/>
                              </corecom:ID>
                           </xsl:if>
                           <xsl:if test="count(req1:assignedProduct/req1:requestedAction/req1:requestedDate) > 0">
                              <corecom:Revision>
                                 <corecom:EffectiveDate>
                                    <xsl:value-of select="req1:assignedProduct/req1:requestedAction/req1:requestedDate"/>
                                 </corecom:EffectiveDate>
                              </corecom:Revision>
                           </xsl:if>
                        </corecom:ItemIdentification>
                     </corecom:ItemReference>
                     <xsl:if test="count(req1:assignedProduct/req1:installationPoint/req1:identifier/req1:id) > 0">
                        <corecom:InstalledProductReference>
                           <corecom:InstalledProductIdentification>
                              <corecom:ID>
                                 <xsl:value-of select="req1:assignedProduct/req1:installationPoint/req1:identifier/req1:id"/>
                              </corecom:ID>
                           </corecom:InstalledProductIdentification>
                        </corecom:InstalledProductReference>
                     </xsl:if>
                     <salesorderebo:SalesOrderLineSpecificationGroup>
                        <corecom:SpecificationGroup>
                           <xsl:if test="count(/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:customerOrderItem/req1:assignedProduct/req1:name) > 0">
                              <corecom:Name>
                                 <xsl:value-of select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:customerOrderItem/req1:assignedProduct/req1:name"/>
                              </corecom:Name>
                           </xsl:if>
                           <corecom:Specification>
                              <corecom:Identification>
                                 <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:charVal">
                                    <xsl:if test="req1:name = 'ESTIMATED DUE DATE'">
                                       <corecom:ApplicationObjectKey>
                                          <corecom:ID>
                                             <xsl:value-of select="req1:value"/>
                                          </corecom:ID>
                                          <corecom:ContextID>
                                             <xsl:value-of select="req1:name"/>
                                          </corecom:ContextID>
                                       </corecom:ApplicationObjectKey>
                                    </xsl:if>
                                 </xsl:for-each>
                                 <xsl:for-each select="/tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:comment">
                                    <xsl:if test="req1:type/req1:value = 'Detailed Remark'">
                                       <corecom:AlternateObjectKey>
                                          <corecom:ID>
                                             <xsl:value-of select="req1:comment"/>
                                          </corecom:ID>
                                          <corecom:ContextID>
                                             <xsl:value-of select="req1:type/req1:value"/>
                                          </corecom:ContextID>
                                       </corecom:AlternateObjectKey>
                                    </xsl:if>
                                 </xsl:for-each>
                              </corecom:Identification>
                              <xsl:if test="count(req1:assignedProduct/req1:requestedAction/req1:dueDate) > 0">
                                 <corecom:ValueDate>
                                    <xsl:value-of select="req1:assignedProduct/req1:requestedAction/req1:dueDate"/>
                                 </corecom:ValueDate>
                              </xsl:if>
                           </corecom:Specification>
                        </corecom:SpecificationGroup>
                     </salesorderebo:SalesOrderLineSpecificationGroup>
                  </salesorderebo:SalesOrderLine>
                  <xsl:apply-templates select="req1:assignedProduct/req1:containAssignedProduct"/>
               </xsl:for-each>
               <!-- CWS CRC06_2017 -->
               <xsl:for-each select="/tns:EventDataOrderProgress/tns:referenceData/tns:delivery">
                  <salesorderebo:SalesOrderAttachment>
                     <corecom:Identification>
                        <corecom:BusinessComponentID>
                           <xsl:value-of select="req1:reference"/>
                        </corecom:BusinessComponentID>
                        <xsl:if test="req1:date != ''">
                           <corecom:ID>
                              <xsl:value-of select="req1:date"/>
                           </corecom:ID>
                        </xsl:if>
                        <corecom:ContextID>
                           <xsl:value-of select="req1:method/req1:value"/>
                        </corecom:ContextID>
                        <corecom:ApplicationObjectKey>
                           <corecom:ID>
                              <xsl:value-of select="req1:carrier/req1:value"/>
                           </corecom:ID>
                        </corecom:ApplicationObjectKey>
                        <xsl:if test="req1:requestedTime/req1:startTimeStamp != ''">
                           <corecom:AlternateObjectKey>
                              <corecom:ID>
                                 <xsl:value-of select="req1:requestedTime/req1:startTimeStamp"/>
                              </corecom:ID>
                           </corecom:AlternateObjectKey>
                        </xsl:if>
                        <corecom:Revision>
                           <xsl:variable name="AddrId"
                                         select="req1:addressIdentifier/req1:id"/>
                           <corecom:Description>
                              <xsl:value-of select="req1:pointIdentifier/req1:id"/>
                           </corecom:Description>
                           <corecom:Label>
                              <xsl:value-of select="../tns:urbanAddress/req1:urbanSubAddress/req1:identifier[req1:id = $AddrId]/req1:mainKey"/>
                           </corecom:Label>
                           <corecom:Reason>
                              <xsl:value-of select="../tns:urbanAddress/req1:urbanSubAddress/req1:identifier[req1:id = $AddrId]/req1:subKey"/>
                           </corecom:Reason>
                        </corecom:Revision>
                     </corecom:Identification>
                     <!--<corecom:Attachment>
                        <corecom:PurposeCode>
                           <xsl:value-of select="../tns:urbanAddress/req1:urbanAddress/req1:identifier[req1:id = $AddrId]/req1:mainKey"/>
                        </corecom:PurposeCode>
                     </corecom:Attachment> -->
                  </salesorderebo:SalesOrderAttachment>
               </xsl:for-each>
               <xsl:for-each select="/tns:EventDataOrderProgress/tns:referenceData/tns:workOrder">
                  <salesorderebo:SalesOrderCharge>
                     <corecom:Identification>
                        <corecom:BusinessComponentID>
                           <xsl:value-of select="req1:identifier/req1:id"/>
                        </corecom:BusinessComponentID>
                        <corecom:ID>
                           <xsl:value-of select="req1:type/req1:value"/>
                        </corecom:ID>
                        <corecom:ContextID>
                           <xsl:value-of select="req1:sequenceNumber"/>
                        </corecom:ContextID>
                        <corecom:ApplicationObjectKey>
                           <corecom:ID>
                              <xsl:value-of select="req1:jobCode/req1:value"/>
                           </corecom:ID>
                           <corecom:ContextID>
                              <xsl:value-of select="req1:estimatedDuration"/>
                           </corecom:ContextID>
                        </corecom:ApplicationObjectKey>
                        <xsl:for-each select="req1:charVal">
                           <corecom:AlternateObjectKey>
                              <corecom:ID>
                                 <xsl:value-of select="req1:characteristicName"/>
                              </corecom:ID>
                              <corecom:ContextID>
                                 <xsl:value-of select="req1:value"/>
                              </corecom:ContextID>
                           </corecom:AlternateObjectKey>
                        </xsl:for-each>
                        <xsl:variable name="WOId"
                                      select="req1:identifier/req1:id"/>
                        <corecom:Revision>
                           <corecom:Number>
                              <xsl:value-of select="../tns:appointment[req1:workOrderIdentifier/req1:id = $WOId]/req1:timeSlot/req1:value"/>
                           </corecom:Number>
                           <corecom:Description>
                              <xsl:value-of select="../tns:provisioningOrder/req1:status/req1:codeDescription"/>
                           </corecom:Description>
                           <corecom:EffectiveDate>
                              <xsl:value-of select="../tns:appointment[req1:workOrderIdentifier/req1:id = $WOId]/req1:duration/req1:startTimeStamp"/>
                           </corecom:EffectiveDate>
                           <corecom:EffectiveEndDate>
                              <xsl:value-of select="../tns:appointment[req1:workOrderIdentifier/req1:id = $WOId]/req1:duration/req1:endTimeStamp"/>
                           </corecom:EffectiveEndDate>
                           <corecom:Label>
                              <xsl:value-of select="../tns:appointment[req1:workOrderIdentifier/req1:id = $WOId]/req1:dayOfWeek/req1:value"/>
                           </corecom:Label>
                           <corecom:Reason>
                              <xsl:value-of select="../tns:provisioningOrder/req1:status/req1:value"/>
                           </corecom:Reason>
                        </corecom:Revision>
                     </corecom:Identification>
                  </salesorderebo:SalesOrderCharge>
               </xsl:for-each>
               <!-- CWS Changes CRC06_2017 -->
            </salesorderebo:UpdateSalesOrderLineStatusList>
         </salesorderebo:DataArea>
      </salesorderebo:UpdateSalesOrderLineStatusListEBM>
   </xsl:template>
   <xsl:template match="req1:containAssignedProduct">
      <salesorderebo:SalesOrderLine>
         <xsl:if test="count(req1:type/req1:value) > 0">
            <salesorderebo:TypeCode>
               <xsl:value-of select="req1:type/req1:value"/>
            </salesorderebo:TypeCode>
         </xsl:if>
         <xsl:if test="count(req1:status/req1:value) > 0">
            <corecom:Status>
               <corecom:Code>
                  <xsl:value-of select="req1:status/req1:value"/>
               </corecom:Code>
            </corecom:Status>
         </xsl:if>
         <xsl:if test="count(req1:installationDate) > 0">
            <corecom:EffectiveTimePeriod>
               <corecom:StartDateTime>
                  <xsl:value-of select="req1:installationDate"/>
               </corecom:StartDateTime>
            </corecom:EffectiveTimePeriod>
         </xsl:if>
         <corecom:ItemReference>
            <corecom:ItemIdentification>
               <xsl:if test="count(req1:serviceIdentifier/req1:id) > 0">
                  <corecom:BusinessComponentID>
                     <xsl:value-of select="req1:serviceIdentifier/req1:id"/>
                  </corecom:BusinessComponentID>
               </xsl:if>
               <xsl:if test="count(req1:identifier/req1:id) > 0">
                  <corecom:ID>
                     <xsl:value-of select="req1:identifier/req1:id"/>
                  </corecom:ID>
               </xsl:if>
               <corecom:Revision>
                  <xsl:if test="req1:requestedAction/req1:requestedDate != ''">
                     <corecom:EffectiveDate>
                        <xsl:value-of select="req1:requestedAction/req1:requestedDate"/>
                     </corecom:EffectiveDate>
                  </xsl:if>
               </corecom:Revision>
            </corecom:ItemIdentification>
         </corecom:ItemReference>
         <xsl:if test="count(req1:installationPoint/req1:identifier/req1:id) > 0">
            <corecom:InstalledProductReference>
               <corecom:InstalledProductIdentification>
                  <corecom:ID>
                     <xsl:value-of select="req1:installationPoint/req1:identifier/req1:id"/>
                  </corecom:ID>
               </corecom:InstalledProductIdentification>
            </corecom:InstalledProductReference>
         </xsl:if>
         <salesorderebo:SalesOrderLineSpecificationGroup>
            <corecom:SpecificationGroup>
               <xsl:if test="count(req1:name/req1:defaultName) > 0">
                  <corecom:Name>
                     <xsl:value-of select="req1:name/req1:defaultName"/>
                  </corecom:Name>
               </xsl:if>
               <corecom:Specification>
                  <corecom:Identification>
                     <xsl:for-each select="tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:comment">
                        <xsl:if test="req1:type/req1:value = 'Estimated Due Date'">
                           <corecom:ApplicationObjectKey>
                              <corecom:ID>
                                 <xsl:value-of select="req1:comment"/>
                              </corecom:ID>
                              <corecom:ContextID>
                                 <xsl:value-of select="req1:type/req1:value"/>
                              </corecom:ContextID>
                           </corecom:ApplicationObjectKey>
                        </xsl:if>
                     </xsl:for-each>
                     <xsl:for-each select="tns:EventDataOrderProgress/tns:notification/req1:customerOrder/req1:comment">
                        <xsl:if test="req1:type/req1:value = 'Detailed Remark'">
                           <corecom:AlternateObjectKey>
                              <corecom:ID>
                                 <xsl:value-of select="req1:comment"/>
                              </corecom:ID>
                              <corecom:ContextID>
                                 <xsl:value-of select="req1:type/req1:value"/>
                              </corecom:ContextID>
                           </corecom:AlternateObjectKey>
                        </xsl:if>
                     </xsl:for-each>
                  </corecom:Identification>
                  <xsl:if test="req1:requestedAction/req1:dueDate != ''">
                     <corecom:ValueDate>
                        <xsl:value-of select="req1:requestedAction/req1:dueDate"/>
                     </corecom:ValueDate>
                  </xsl:if>
               </corecom:Specification>
            </corecom:SpecificationGroup>
         </salesorderebo:SalesOrderLineSpecificationGroup>
      </salesorderebo:SalesOrderLine>
      <xsl:apply-templates select="./req1:containAssignedProduct"/>
   </xsl:template>
</xsl:stylesheet>
