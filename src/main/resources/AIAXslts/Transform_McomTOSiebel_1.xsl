<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ns2="urn:v2.product.beim.objects.bgc"
                xmlns:ehdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.esb.server.headers.ESBHeaderFunctions"
                xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
                xmlns:ebocontext="http://xmlns.oracle.com/EBO/BusinessContext/V1"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:corecomEBO="http://xmlns.oracle.com/EnterpriseObjects/Core/CommonEBO/V1"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/"
                xmlns:ns4="urn:v2.commonprimary.beim.objects.bgc"
                xmlns:corecomcust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:xsdLocal1="http://siebel.com/OrderManagement/Order/Data"
                xmlns:orcl="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xacml="urn:oasis:names:tc:xacml:2.0:policy:schema:cd:04"
                xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:ns3="urn:v2.commonsecondary.beim.objects.bgc"
                xmlns:ns0="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2"
                xmlns:tns="http://siebel.com/asi"
                xmlns:svcdoc="http://xmlns.oracle.com/Services/Documentation/V1"
                xmlns:coresalesordercust="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/SalesOrder/V2"
                xmlns:wsa="http://schemas.xmlsoap.org/ws/2003/03/addressing"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xacml-context="urn:oasis:names:tc:xacml:2.0:context:schema:cd:04"
                xmlns:ns1="urn:v2.resource.beim.objects.bgc"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                exclude-result-prefixes="xsl ebocontext xsd corecomEBO corecomcust xacml corecom ns0 svcdoc coresalesordercust wsa xacml-context soapenc xsdLocal1 tns soap ehdr aia xp20 ora orcl bpws hwf xref ids"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue">
 <xsl:template match="/">
  <xsdLocal1:ListOfSWIOrderIO>
   <xsdLocal1:SWIOrder>
    <xsl:if test="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status/corecom:Code ='RECUPERATION_START'">
     <xsdLocal1:RecuperationDate>
      <!-- <xsl:value-of select='xp20:format-dateTime(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status[corecom:Code = "RECUPERATION_START"]/corecom:SubStatusCode,"[M01]/[D01]/[Y0001] [h01]:[m01]:[s01]")'/> -->
     </xsdLocal1:RecuperationDate>
    </xsl:if>
    <xsl:if test='count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:OrderDateTime) > 0'>
     <xsdLocal1:NotificationTS>
      <xsl:text disable-output-escaping="no">''</xsl:text>
     </xsdLocal1:NotificationTS>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:TypeCode) > 0">
     <xsdLocal1:NotificationSubject>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:TypeCode"/>
     </xsdLocal1:NotificationSubject>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:BusinessComponentID) > 0">
     <xsdLocal1:OrderNumber>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:BusinessComponentID"/>
     </xsdLocal1:OrderNumber>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:EarliestShipDateTime) > 0">
     <xsdLocal1:MoveOutDate>
      <!-- <xsl:value-of select='xp20:format-dateTime(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:EarliestShipDateTime,"[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]")'/> -->
     </xsdLocal1:MoveOutDate>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SubstitutionAllowedIndicator) > 0">
     <xsdLocal1:OrderMode>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SubstitutionAllowedIndicator"/>
     </xsdLocal1:OrderMode>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:ID) > 0">
     <xsdLocal1:AccountIntegrationId>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:ID"/>
     </xsdLocal1:AccountIntegrationId>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Status/corecom:SubStatusCode) > 0">
     <xsdLocal1:StatusReason>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Status/corecom:SubStatusCode"/>
     </xsdLocal1:StatusReason>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:Description) > 0">
     <xsdLocal1:StatusDetailedReason>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:Description"/>
     </xsdLocal1:StatusDetailedReason>
    </xsl:if>
    <xsl:choose>
     <xsl:when test="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:OwnerPartyReference/corecom:PartyIdentification/corecom:ID !=''  and /ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status[corecom:Code = 'IMNumber']/corecom:SubStatusCode !=''">
      <xsdLocal1:StatusDetailedReasonDescription>
       <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:OwnerPartyReference/corecom:PartyIdentification/corecom:ID"/>
       <xsl:value-of select="' '"/>
       <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status[corecom:Code = 'IMNumber']/corecom:SubStatusCode"/>
      </xsdLocal1:StatusDetailedReasonDescription>
     </xsl:when>
     <xsl:when test="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:OwnerPartyReference/corecom:PartyIdentification/corecom:ID =''  and /ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status[corecom:Code = 'IMNumber']/corecom:SubStatusCode !=''">
      <xsdLocal1:StatusDetailedReasonDescription>
       <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status[corecom:Code = 'IMNumber']/corecom:SubStatusCode"/>
      </xsdLocal1:StatusDetailedReasonDescription>
     </xsl:when>
     <xsl:otherwise>
      <xsdLocal1:StatusDetailedReasonDescription>
       <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:OwnerPartyReference/corecom:PartyIdentification/corecom:ID"/>
      </xsdLocal1:StatusDetailedReasonDescription>
     </xsl:otherwise>
    </xsl:choose>
    <xsdLocal1:StatusOrigin>
     <xsl:text disable-output-escaping="no">MCOM</xsl:text>
    </xsdLocal1:StatusOrigin>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:AlternateObjectKey/corecom:ContextID) > 0">
     <xsdLocal1:PrimarySalesRepLogin>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:AlternateObjectKey/corecom:ContextID"/>
     </xsdLocal1:PrimarySalesRepLogin>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesChannelCode) > 0">
     <xsdLocal1:SalesChannel>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesChannelCode"/>
     </xsdLocal1:SalesChannel>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:Revision/corecom:Number) > 0">
     <xsdLocal1:Revision>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:Revision/corecom:Number"/>
     </xsdLocal1:Revision>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Status/corecom:Code) > 0">
     <xsdLocal1:Status>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Status/corecom:Code"/>
     </xsdLocal1:Status>
    </xsl:if>
    <xsl:if test="count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:ContextID) > 0">
     <xsdLocal1:OMSOrderId>
      <xsl:value-of select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Identification/corecom:ContextID"/>
     </xsdLocal1:OMSOrderId>
    </xsl:if>
    <xsl:if test='count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:OrderDateTime) > 0'>
     <xsdLocal1:StatusNotificationDate>
     <!-- <xsl:value-of select='xp20:format-dateTime(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:OrderDateTime,"[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]")'/> -->
     </xsdLocal1:StatusNotificationDate>
    </xsl:if>
    <!--<xsl:if test="../ns0:PromisedDeliveryDateTime != &quot;&quot;">
               <xsdLocal1:ActivationDate/>
            </xsl:if>-->
    <xsl:if test='count(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:PromisedDeliveryDateTime) > 0'>
     <xsdLocal1:ActivationDate>
     <!-- <xsl:value-of select='xp20:format-dateTime(/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:PromisedDeliveryDateTime,"[M01]/[D01]/[Y0001] [h01]:[m01]:[s01]")'/> -->
     </xsdLocal1:ActivationDate>
    </xsl:if>
    <xsl:for-each select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/corecom:Note/corecom:Status">
     <xsl:if test='corecom:Code = "EXCEPTION_OCCURED"'>
      <xsdLocal1:ExceptionForWorklist>
       <xsl:value-of select="corecom:SubStatusCode"/>
      </xsdLocal1:ExceptionForWorklist>
     </xsl:if>
     <xsl:if test='corecom:Code = "ESTIMATED DUE DATE"'>
      <xsdLocal1:EstimatedDueDate>
       <!--<xsl:value-of select='xp20:format-dateTime(corecom:SubStatusCode,"[M01]/[D01]/[Y0001] [h01]:[m01]:[s01]")'/> -->
      </xsdLocal1:EstimatedDueDate>
     </xsl:if>
     <!--xsl:if test='corecom:Code = "EXCEPTION_RESOLVED"'>
      <xsdLocal1:ExceptionResolved>
       <xsl:value-of select="corecom:SubStatusCode"/>
      </xsdLocal1:ExceptionResolved>
     </xsl:if-->
     <xsl:if test='corecom:Code = "EXCEPTION_REMARK"'>
      <xsdLocal1:ExceptionRemark>
       <xsl:value-of select="corecom:SubStatusCode"/>
      </xsdLocal1:ExceptionRemark>
     </xsl:if>
     <xsl:if test='corecom:Code = "ERROR_CODE"'>
      <xsdLocal1:BGCExceptionError>
       <xsl:value-of select="corecom:SubStatusCode"/>
      </xsdLocal1:BGCExceptionError>
     </xsl:if>
     <!-- Added in CRC06 2016 Move CR -->
     <!--xsl:if test='corecom:Code = "RECUPERATION_START"'>
      <xsdLocal1:RecuperationDate>
       <xsl:value-of select='xp20:format-dateTime(corecom:SubStatusCode,"[M01]/[D01]/[Y0001] [h01]:[m01]:[s01]")'/>
      </xsdLocal1:RecuperationDate>
     </xsl:if-->
     <!-- Added in CRC06 2016 Move CR -->
    </xsl:for-each>
    <!-- These 2 new mappings are added in order to make sure that notifications containing tasks are not missed out. These fields wouldnt be sent towards SHE
    These are used for calculation of Task present or not at Item Leve. Depending on that AIA would set appropriate header towards SHE so that SHE does not ignore such notifcations-->
    <xsl:for-each select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesOrderLine">
     <xsl:for-each select="corecom:Note/corecom:Status">
      <xsl:if test='corecom:Code = "EXCEPTION_RESOLVED"'>
       <xsl:if test="corecom:SubStatusCode= 'Y'">
        <xsdLocal1:SendLetter>
         <xsl:value-of select="corecom:SubStatusCode"/>
        </xsdLocal1:SendLetter>
       </xsl:if>
      </xsl:if>
     </xsl:for-each>
    </xsl:for-each>
    <xsl:for-each select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesOrderLine">
     <xsl:for-each select="corecom:Note/corecom:Status">
      <xsl:if test='corecom:Code = "EXCEPTION_OCCURED"'>
       <xsl:if test="corecom:SubStatusCode= 'Y'">
        <xsdLocal1:SeenFlag>
         <xsl:value-of select="corecom:SubStatusCode"/>
        </xsdLocal1:SeenFlag>
       </xsl:if>
      </xsl:if>
     </xsl:for-each>
    </xsl:for-each>
    <!--End New Code-->
    <xsdLocal1:ListOfSWIOrderItem>
     <xsl:for-each select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesOrderLine">
      <xsdLocal1:SWIOrderItem>
       <xsl:for-each select="corecom:Note/corecom:Status">
        <xsl:if test='corecom:Code = "IS_PROVISIONING_COMPLETE"'>
         <xsl:if test="corecom:SubStatusCode != ''">
          <xsdLocal1:isProvisioningComplete>
           <xsl:value-of select="corecom:SubStatusCode"/>
          </xsdLocal1:isProvisioningComplete>
         </xsl:if>
        </xsl:if>
       </xsl:for-each>
       <xsl:if test="count(corecom:Status/corecom:Code) > 0 ">
        <xsdLocal1:DetailedStatus>
         <xsl:value-of select="corecom:Status/corecom:Code"/>
        </xsdLocal1:DetailedStatus>
       </xsl:if>
       <xsl:if test='corecom:EffectiveTimePeriod/corecom:StartDateTime != ""'>
        <xsdLocal1:ActivationDate/>
       </xsl:if>
       <xsl:if test="count(ns0:Description) > 0">
        <xsdLocal1:DetailedRemark>
         <xsl:value-of select="ns0:Description"/>
        </xsdLocal1:DetailedRemark>
       </xsl:if>
       <xsl:if test="count(ns0:ReasonCode) > 0">
        <xsdLocal1:ReasonCode>
         <xsl:value-of select="ns0:ReasonCode"/>
        </xsdLocal1:ReasonCode>
       </xsl:if>
       <xsl:if test="count(corecom:ItemReference/corecom:ItemIdentification/corecom:ID) > 0">
        <xsdLocal1:APId>
         <xsl:value-of select="corecom:ItemReference/corecom:ItemIdentification/corecom:ID"/>
        </xsdLocal1:APId>
       </xsl:if>
       <xsl:if test="count(corecom:Identification/corecom:ID) > 0">
        <xsdLocal1:Id>
         <xsl:value-of select="corecom:Identification/corecom:ID"/>
        </xsdLocal1:Id>
       </xsl:if>
       <xsl:if test="count(ns0:SalesOrderLineSpecificationGroup/corecom:SpecificationGroup/corecom:Name) > 0">
        <xsdLocal1:Name>
         <xsl:value-of select="ns0:SalesOrderLineSpecificationGroup/corecom:SpecificationGroup/corecom:Name"/>
        </xsdLocal1:Name>
       </xsl:if>
       <xsl:if test='count(ns0:SalesOrderLineSpecificationGroup/corecom:SpecificationGroup/corecom:Specification/corecom:ValueDate) > 0'>
        <xsdLocal1:DueDate/>
       </xsl:if>
       <xsl:if test="count(corecom:InstalledProductReference/corecom:InstalledProductIdentification/corecom:ID) > 0">
        <xsdLocal1:InstallationId>
         <xsl:value-of select="corecom:InstalledProductReference/corecom:InstalledProductIdentification/corecom:ID"/>
        </xsdLocal1:InstallationId>
       </xsl:if>
       <xsl:if test="count(ns0:SalesOrderLineSpecificationGroup/corecom:SpecificationGroup/corecom:Specification/corecom:Identification/corecom:AlternateObjectKey/corecom:ID) > 0">
        <xsdLocal1:Description>
         <xsl:value-of select="ns0:SalesOrderLineSpecificationGroup/corecom:SpecificationGroup/corecom:Specification/corecom:Identification/corecom:AlternateObjectKey/corecom:ID"/>
        </xsdLocal1:Description>
       </xsl:if>
       <xsl:if test='count(corecom:ItemReference/corecom:ItemIdentification/corecom:Revision/corecom:EffectiveDate) > 0'>
        <xsdLocal1:WishDate/>
       </xsl:if>
       <xsl:if test="count(corecom:ItemReference/corecom:ItemIdentification/corecom:BusinessComponentID) > 0">
        <xsdLocal1:FutureServiceId>
         <xsl:value-of select="corecom:ItemReference/corecom:ItemIdentification/corecom:BusinessComponentID"/>
        </xsdLocal1:FutureServiceId>
       </xsl:if>
       <xsl:if test="count(ns0:TypeCode) > 0">
        <xsdLocal1:ProductTypeCode>
         <xsl:value-of select="ns0:TypeCode"/>
        </xsdLocal1:ProductTypeCode>
       </xsl:if>
       <xsl:for-each select="corecom:Note/corecom:Status">
        <xsl:if test='corecom:Code = "EXCEPTION_RESOLVED"'>
         <xsdLocal1:ExceptionResolved>
          <xsl:value-of select="corecom:SubStatusCode"/>
         </xsdLocal1:ExceptionResolved>
        </xsl:if>
        <xsl:if test='corecom:Code = "EXCEPTION_REMARK"'>
         <xsdLocal1:ExceptionRemark>
          <xsl:value-of select="corecom:SubStatusCode"/>
         </xsdLocal1:ExceptionRemark>
        </xsl:if>
        <xsl:if test='corecom:Code = "EXCEPTION_OCCURED"'>
         <xsdLocal1:ExceptionOccured>
          <xsl:value-of select="corecom:SubStatusCode"/>
         </xsdLocal1:ExceptionOccured>
        </xsl:if>
        <xsl:if test='corecom:Code = "ERROR_CODE"'>
         <xsdLocal1:BGCExceptionError>
          <xsl:value-of select="corecom:SubStatusCode"/>
         </xsdLocal1:BGCExceptionError>
        </xsl:if>
        <!-- FD-CRC02 : 1573013D01 EPIC15 Exception Handling  Start Developer# priyanka -->
        <xsl:if test='corecom:Code = "IMNumber"'>
         <xsdLocal1:IMNumber>
          <xsl:value-of select="corecom:SubStatusCode"/>
         </xsdLocal1:IMNumber>
        </xsl:if>
        <!-- FD-CRC02 : 1573013D01 EPIC15 Exception Handling  End Developer# priyanka -->
       </xsl:for-each>
      </xsdLocal1:SWIOrderItem>
     </xsl:for-each>
    </xsdLocal1:ListOfSWIOrderItem>
    <!-- CWS CRC06_2017 Changes -->
    <xsdLocal1:ListOfShippingEntity>
     <xsl:for-each select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesOrderAttachment">
      <xsdLocal1:ShippingEntity>
      <xsl:if test="corecom:Identification/corecom:AlternateObjectKey/corecom:ID != ''">
       <xsdLocal1:ShippingSlot>
        <!-- <xsl:value-of select='xp20:format-dateTime(corecom:Identification/corecom:AlternateObjectKey/corecom:ID,"[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]")'/> -->
       </xsdLocal1:ShippingSlot>
       </xsl:if>
       <xsdLocal1:CarrierType>
        <xsl:value-of select="corecom:Identification/corecom:ApplicationObjectKey/corecom:ID"/>
       </xsdLocal1:CarrierType>
       <xsdLocal1:KialaDeliveryPoint>
        <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Description"/>
       </xsdLocal1:KialaDeliveryPoint>
       <xsl:if test="corecom:Identification/corecom:Revision/corecom:Label != ''">
        <xsdLocal1:ShipToAddressMainKey>
         <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Label"/>
        </xsdLocal1:ShipToAddressMainKey>
        <xsdLocal1:ShipToAddressSubKey>
         <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Reason"/>
        </xsdLocal1:ShipToAddressSubKey>
       </xsl:if>
       <xsl:if test="corecom:Attachment/corecom:PurposeCode != ''">
        <xsdLocal1:ShipToAddressMainKey>
         <xsl:value-of select="corecom:Attachment/corecom:PurposeCode"/>
        </xsdLocal1:ShipToAddressMainKey>
       </xsl:if>
       <xsdLocal1:DeliveryId>
        <xsl:value-of select="corecom:Identification/corecom:BusinessComponentID"/>
       </xsdLocal1:DeliveryId>
       <xsdLocal1:DeliveryMethod>
        <xsl:value-of select="corecom:Identification/corecom:ContextID"/>
       </xsdLocal1:DeliveryMethod>
       <xsl:if test="corecom:Identification/corecom:ID != ''">
        <xsdLocal1:RequestedShipDate>
         <!--<xsl:value-of select='xp20:format-dateTime(corecom:Identification/corecom:ID,"[M01]/[D01]/[Y0001]")'/>-->
        </xsdLocal1:RequestedShipDate>
       </xsl:if>
      </xsdLocal1:ShippingEntity>
     </xsl:for-each>
    </xsdLocal1:ListOfShippingEntity>
    <xsdLocal1:ListOfWo>
     <xsl:for-each select="/ns0:UpdateSalesOrderLineStatusListEBM/ns0:DataArea/ns0:UpdateSalesOrderLineStatusList/ns0:SalesOrderCharge">
      <xsdLocal1:WorkOrder>
        <xsdLocal1:WONature>
         <xsl:value-of select="corecom:Identification/corecom:AlternateObjectKey[corecom:ID = 'WO_NATURE']/corecom:ContextID"/>
        </xsdLocal1:WONature>
       <xsdLocal1:WoId>
        <xsl:value-of select="corecom:Identification/corecom:BusinessComponentID"/>
       </xsdLocal1:WoId>
       <xsdLocal1:WoType>
        <xsl:value-of select="corecom:Identification/corecom:ID"/>
       </xsdLocal1:WoType>
       <xsdLocal1:WoSeqnr>
        <xsl:value-of select="corecom:Identification/corecom:ContextID"/>
       </xsdLocal1:WoSeqnr>
       <xsdLocal1:JobCode>
        <xsl:value-of select="corecom:Identification/corecom:ApplicationObjectKey/corecom:ID"/>
       </xsdLocal1:JobCode>
       <xsdLocal1:Duration>
        <xsl:value-of select="corecom:Identification/corecom:ApplicationObjectKey/corecom:ContextID"/>
       </xsdLocal1:Duration>
       <xsl:if test="corecom:Identification/corecom:Revision/corecom:EffectiveDate != ''">
        <xsdLocal1:StartTime>
         <!-- <xsl:value-of select='xp20:format-dateTime(corecom:Identification/corecom:Revision/corecom:EffectiveDate,"[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]")'/> -->
        </xsdLocal1:StartTime>
       </xsl:if>
       <xsl:if test="corecom:Identification/corecom:Revision/corecom:EffectiveEndDate != ''">
        <xsdLocal1:EndTime>
         <!-- <xsl:value-of select='xp20:format-dateTime(corecom:Identification/corecom:Revision/corecom:EffectiveEndDate,"[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]")'/> -->
        </xsdLocal1:EndTime>
       </xsl:if>
       <xsdLocal1:AppointmentDay>
        <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Label"/>
       </xsdLocal1:AppointmentDay>
       <xsdLocal1:AppointmentType>
        <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Number"/>
       </xsdLocal1:AppointmentType>
       <xsl:if test="corecom:Identification/corecom:Revision/corecom:EffectiveEndDate != ''">
       <xsdLocal1:InServiceDate>
        <!-- <xsl:value-of select='xp20:format-dateTime(corecom:Identification/corecom:Revision/corecom:EffectiveEndDate,"[M01]/[D01]/[Y0001] [H01]:[m01]:[s01]")'/> -->
       </xsdLocal1:InServiceDate>
       </xsl:if>
       <xsdLocal1:FeedbackCode>
        <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Description"/>
       </xsdLocal1:FeedbackCode>
       <xsdLocal1:FeedbackDescription>
        <xsl:value-of select="corecom:Identification/corecom:Revision/corecom:Reason"/>
       </xsdLocal1:FeedbackDescription>
      </xsdLocal1:WorkOrder>
     </xsl:for-each>
    </xsdLocal1:ListOfWo>
    <!-- CWS Changes CRC06_2017 -->
   </xsdLocal1:SWIOrder>
  </xsdLocal1:ListOfSWIOrderIO>
 </xsl:template>
</xsl:stylesheet>
