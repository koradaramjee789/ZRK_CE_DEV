@EndUserText.label: 'Shipment Request'
@ObjectModel.query.implementedBy: 'ABAP:ZRK_CL_CE_SHIPMENT_REQ'
define root custom entity ZRK_CE_I_ShipReq
  // with parameters parameter_name : parameter_type
{

//@UI.facet: [{  }]

      @EndUserText.label: 'Shipment Req.No.'
      @UI.selectionField: [{position: 10 }]
      @UI.lineItem   : [{ position: 10 }]
      @UI.identification: [{ position: 10 }]
  key ShipReqNo      : zrk_ship_req;
      @EndUserText.label: ''
      @UI.lineItem   : [{ position: 20 }]
      @UI.identification: [{ position: 20 }]
      Description    : /dmo/description;
      @EndUserText.label: 'Submission Date'
      @Consumption.filter.selectionType: #INTERVAL
      @UI.selectionField: [{position: 40 }]
      @UI.lineItem   : [{ position: 30 }]
      @UI.identification: [{ position: 30 }]
      SubmissionDate : abap.dats;
      @EndUserText.label: 'Name'
      @UI.lineItem   : [{ position: 40 }]
      @UI.identification: [{ position: 40 }]
      SenderName     : abap.char( 40 );
      @EndUserText.label: 'Company'
      @UI.identification: [{ position: 10 }]
      SenderCompany  : abap.char( 40 );
      @EndUserText.label: 'Street No'
      @UI.lineItem   : [{ position: 50 }]
      @UI.identification: [{ position: 50 }]
      SenderStreetNo : abap.char( 40 );
      @EndUserText.label: 'City'
      @UI.lineItem   : [{ position: 60 }]
      @UI.selectionField: [{position: 20 }]
      @UI.identification: [{ position: 60 }]
      SenderCity     : abap.char( 20 );
      @EndUserText.label: 'Zip Code'
      @UI.identification: [{ position: 70 }]
      SenderZipCode  : abap.numc( 5 );
      @EndUserText.label: 'Country'
      @UI.lineItem   : [{ position: 60 }]
      @UI.selectionField: [{position: 30 }]
      @UI.identification: [{ position: 80 }]
      SenderCountry  : abap.char( 20 );
}
