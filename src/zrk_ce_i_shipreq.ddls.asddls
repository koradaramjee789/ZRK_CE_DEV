@EndUserText.label: 'Shipment Request'
@ObjectModel.query.implementedBy: 'ABAP:ZRK_CL_CE_SHIPMENT_REQ'
@UI.headerInfo: {
    typeName: 'Shipment Request',
    typeNamePlural: 'Shipment Requests',
    title: {
        type: #STANDARD,
        value: 'ShipReqNo'
    },
    description: {
        type: #STANDARD,
        value: 'Description'
    }
}
define root custom entity ZRK_CE_I_ShipReq
  // with parameters parameter_name : parameter_type
  
{

      @UI.facet      : [{
          id         : 'General',
          purpose    : #STANDARD,
          parentId   : '',
          position   : 10,
          isPartOfPreview: true,
          label      : 'General',
          type       :  #COLLECTION,
          targetQualifier: 'General'
      },
      {
          id         : 'BasicInfo',
          purpose    : #STANDARD,
          parentId   : 'General',
          position   : 10,
          isPartOfPreview: true,
          label      : 'Basic Info',
          type       :  #FIELDGROUP_REFERENCE,
          targetQualifier: 'QFBasicInfo'
      },
      {
          id         : 'SenderAddress',
          purpose    : #QUICK_VIEW,
          parentId   : 'General',
          position   : 20,
          isPartOfPreview: true,
          label      : 'Sender Address',
          type       :  #FIELDGROUP_REFERENCE,
          targetQualifier: 'QFSenderAddress'
      },
      {
          id         : 'Items',
          purpose    : #STANDARD,
          position   : 30,
          label      : 'Items',
          type       :  #LINEITEM_REFERENCE,
          targetElement: '_ShipReqItems'
      }]

      @EndUserText.label: 'Shipment Req.No.'
      @UI.selectionField: [{position: 10 }]
      @UI.lineItem   : [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
  key ShipReqNo      : zrk_ship_req;
      @EndUserText.label: ''
      @UI.lineItem   : [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 10 ,  qualifier: 'QFBasicInfo'  } ]
      Description    : /dmo/description;
      @EndUserText.label: 'Submission Date'
      @Consumption.filter.selectionType: #INTERVAL
      @UI.selectionField: [{position: 40 }]
      @UI.lineItem   : [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 20 ,  qualifier: 'QFBasicInfo'  } ]
      SubmissionDate : abap.dats;
      @EndUserText.label: 'Name'
      @UI.lineItem   : [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 10 ,  qualifier: 'QFSenderAddress'  } ]
      SenderName     : abap.char( 40 );
      @EndUserText.label: 'Company'
      @UI.identification: [{ position: 10 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 20 ,  qualifier: 'QFSenderAddress'  } ]
      SenderCompany  : abap.char( 40 );
      @EndUserText.label: 'Street No'
      @UI.lineItem   : [{ position: 50 }]
      @UI.identification: [{ position: 50 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 30 ,  qualifier: 'QFSenderAddress'  } ]
      SenderStreetNo : abap.char( 40 );
      @EndUserText.label: 'City'
      @UI.lineItem   : [{ position: 60 }]
      @UI.selectionField: [{position: 20 }]
      @UI.identification: [{ position: 60 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 40 ,  qualifier: 'QFSenderAddress'  } ]
      SenderCity     : abap.char( 20 );
      @EndUserText.label: 'Zip Code'
      @UI.identification: [{ position: 70 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 50 ,  qualifier: 'QFSenderAddress'  } ]
      SenderZipCode  : abap.numc( 5 );
      @EndUserText.label: 'Country'
      @UI.lineItem   : [{ position: 60 }]
      @UI.selectionField: [{position: 30 }]
      @UI.identification: [{ position: 80 }]
      @UI.fieldGroup: [ { type: #STANDARD,  position: 60 ,  qualifier: 'QFSenderAddress'  } ]
      @ObjectModel.text.element: ['_Countries.CountryName']
      SenderCountry  :  abap.char( 20 );
      
//      SenderCountryName : _Countries.CountryName ;
      LocalLastChangedOn : abp_locinst_lastchange_tstmpl;
      
      _ShipReqItems : composition [0..*] of ZRK_CE_I_ShipReqItem  ;
      
      _Countries    : association [1..1] to ZRK_I_Country 
                        on $projection.SenderCountry =  _Countries.Country ;
}
